/*
To check whether access is given to read files of a Segment Descriptor
by, KINER SHAH
*/
/*
==Descriptor Frame==
	0-15=limit add
	16-31=base add
	32-39=base add
	40-47=access right byte
		=>40th bit=Accessed(A)
		=>41st bit=Read/Write(R/W)
		=>42nd bit=Conforming/Expandable(C/Ex)
		=>43rd bit=Executable(E)-1/0
		=>44th bit=Segment Descriptor(S)
		=>(45,46)th bit=Descriptor privilege level(DPL)
		=>47th bit=Present(P)
	48-51=limit add
	52=Available(AV)
	53=0
	54=Data size
	55=Granularity
	56-63=base add

	==Selector Frame==
	0-2=Request Privilege Level(RPL)
	2-3=Table Index(TI)
	3-15=Selector
*/
import java.util.*;
import java.math.BigInteger;
class SegmentAccess {
    public static void main(String[] args) {
        String d,s,off;
        Scanner t = new Scanner(System.in);
        System.out.print("Enter descriptor in hexadecimal: ");
        d=t.next();
        String a=new BigInteger(d,16).toString(2);
        String dpl=a.substring(45,47);
        String seg_base=a.substring(16, 40) + a.substring(56,64);
        String seg_limit=a.substring(0,16)+a.substring(48,52);
        System.out.println("Segment descriptor in binary: "+a);
        System.out.println("DPL: "+dpl);
        System.out.println("Segment Base: "+seg_base);
        System.out.println("Segment limit: "+seg_limit);
        System.out.print("Enter selector in hexadecimal: ");
        s=t.next();
        String b=new BigInteger(s,16).toString(2);
        String rpl=b.substring(0,2);
        System.out.print("Enter offset: "); off=t.next();
        String c=new BigInteger(off,16).toString(2);
        BigInteger int_base=new BigInteger(seg_base,2);
        BigInteger int_off=new BigInteger(c,2);
        BigInteger phy_add=int_base.add(int_off);
        //System.out.println("Physical Address: "+phy_add);
        String last20=phy_add.toString(2);
        last20=last20.substring(last20.length()-20,last20.length());
        int int_last20=Integer.parseInt(last20,2);
        int int_lim=Integer.parseInt(seg_limit,2);
        boolean flag=true;
        if(int_last20 <= int_lim) flag=true;
        else flag=false;
        if(flag && a.charAt(47)=='1') {
            if(a.charAt(44)=='0') System.out.println("System segment");
            else {
                if(a.charAt(43)=='0') System.out.println("Data segment\nRead allowed\n");
                else if(a.charAt(41)==1) System.out.println("Code segment\nRead allowed\n");
                else if(a.charAt(41)==0) System.out.println("Code segment\nRead not allowed\n");
            }
        }
        int int_rpl=Integer.parseInt(rpl,2);
        int int_dpl=Integer.parseInt(dpl,2);
        if(int_rpl<=int_dpl) System.out.println("Valid Segment");
        else    System.out.println("Invalid Segment");
    }
}