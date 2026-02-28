Return-Path: <linux-watchdog+bounces-5023-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKSXCUvgomkV7gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5023-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 13:32:11 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E661C2FCD
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 13:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B19203135077
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 12:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2921D43D51C;
	Sat, 28 Feb 2026 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MW6tp5Qi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASA8bB/5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75543D4FC
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281775; cv=none; b=Xme4lgIeZ46VKDhI2QVPaRPPNvmcLwWwHnMb2FTfAmN5cATvUw2mxjlDh3u+3fbKMU5KnPolNI8vCw/h5rc1Ue+B80HsgYuLBdCZ0fV34DowQ/9Dkp62rlLVnWfad1ivqvyHm3Dne+21nXMNsbYFXtgrzYI/MUVFOXx2HucP0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281775; c=relaxed/simple;
	bh=e5pr2oPvUAYu8JAFmPhcApNUXmTIdLegEO08XCkRGxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYeObexTGxT0/yKmMmjBQFrdgMlo7F92m5umUhnAkRw+IJpC/kw+VKApE+mlbLHrLPszP6YE3QtjhCPFZWONnxq01Y9m0m10VsVT5/oUpZanZvYJGW21tgR/FANYw4SDx/P01YKTluPVi1OrlpBLjFF7GXHVfPJpQ39lG5cFFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MW6tp5Qi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASA8bB/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S908CB3859346
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+UPxj+tjssc3U7W8al5a2umE/kNGiM4NRBgcK1RRgk=; b=MW6tp5QiI6GMJSGI
	jOg9Nel3rCdZLAWF+VqPSdLpzJaZBAskO9YPZdfT5h5sLkE3f1XKsHY96InIeiFu
	Cmc6d2DdF41oQmuAMSgqwcBJ/qdCWZ5DEWqLPA6ZEi90uCcI5lB/XEnxb387qGvW
	NUodzi47PWstHDZqUvVQuZb4AA/7fTV5UVZkF4ecAINBldK6cdNN3rNu7p2zPrzK
	QzWFNNDNtOdf1tPxkl772hrBJDnXBndduB5mG/1AkPYpyW16GtaKOzHFdAujuDXJ
	vZBPnieOt71zsPtIr+v/jql3Uz7EvULhD0yPS8Na/H/A/ZbKwu+ArRSVM/ezXT7y
	LgZ0nA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6gucs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824b42b8a81so11694361b3a.3
        for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281772; x=1772886572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+UPxj+tjssc3U7W8al5a2umE/kNGiM4NRBgcK1RRgk=;
        b=ASA8bB/5USASPp4bxuTb4HFZryojNPBb+eqQmWsyMcetRiz8YiY8TV9NAumBu0R5kx
         Urwo+Ud9X9btTaIaKxO3LRZUf08uEqIBUkAZQr3OxELuRJW7H95FF+5w+mMHb8rU6OXy
         wFrr4m4dHtRAaM4Cu4+rHUfOQlqcQ2w++UeSRCiqRA6QouCpd7tKzrn//KCQngKhNaMt
         d9B82M7ldGfFgMeZDKX6OGSMhS2epNdnN2ZJ8PuK3CRgr8PSF4h0qOsEubthhLv0nZ68
         vEeUZluwrYKwnq+XysbFU8xjJw6gLGRhD6vTR8d0BBBEQuiBBepZqWiCmkVTABWVzhZa
         qCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281772; x=1772886572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+UPxj+tjssc3U7W8al5a2umE/kNGiM4NRBgcK1RRgk=;
        b=NLgsJAwg/SOi6rAiA+PAt9syFmVOVAVNs2FB5JCfgyEpLzRywJA2omaoXLihP9ofa0
         0d8JqCU0s1heSgPakUjdlYm1kmZV7yGWq7Qy5J7IP/69ufipnP15rAat+QMpZesP74QK
         dM0v2EYnYPcNFW7hjHWrF5c1JoXlZYRXkKo3LUv/pxGd0Ol6D/vUFweIYMba6ZhljeiW
         1fSrefLkvLlczAhFse+eveyy37BLTS9yGnwJeyDyKowf30AbG51FTXFJd+Rg9B0RXnEU
         k6KQWlkYSEFs+QRG+uXqmhlqbt0oriMDLFA5lodYbOJb6+X6wjV37V5VFanKAEb8z1Wd
         8U0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQTcW/5CVrM/XOFS3UyUhKiVMAd/sWnd+QFtigryc50v6EdB6VmvJu38vnWFuaWp+VIj/bnZkIrJFQP60FEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0zwlaJRXQbBYbZSwkjAZMlQB+YUS/cvLF3s8ahZ7znpzop1bR
	yEmAxA5NqLSCW6tR7wp7MZ7WSUnGaOx4OetJuVPhtlb721Oiz19VqFQVDqo1tzk3ydXUT9KftSi
	uGV6WqLhAXCHwSXx2pLg3X3bybdlh31zgv51ZdOs1/AuPEpdDplsBZ9CDinojf/0Yohc1G3h5C6
	ybwA==
X-Gm-Gg: ATEYQzzXQSK5RhwAeff8JHxdfTTW4fcpvOFkKYzs48fe4s81A58IzGXQX5Coo3xzUT2
	rxKDWW81SyO9h79lyd9SH0vrASCzrG0glzZuVjo1AfxMo4cWj0I0yBWdkAF5BK8uoxgXp/UBGpy
	7pf9eYMymzkONs7bAChaUfhlu5i1SbOfasR4s6HGpsOWPBLn0T/fta/puYxbNTRlQFAP7x2L4zt
	AMpAxy1attontyVMxrCas3YNfWI4PUVcowFp6RlsRv/TQAQeH1olrf5ofPIwD460do4EBaxnv9D
	BM5GYxmcqAOfu6HA4RIA2rbbT7+0VPrabwa7WjUD6yX0FTf+3YwQRqSXpznokR9kpiJEUVe0GLR
	r8TZNid+glNffeK/zONk0omNVFjH0ZK92SnXmv+l+I7cEuFDWW58uxsPnQUCC1IpVO9em1cdeY8
	IM9dJH+ehJMFVkQnPbLRgIa4Xp3PL0ypBaZqlB0HMyIyNScyXWtVVVUtjE
X-Received: by 2002:a05:6a00:6b93:20b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-8274d9408dcmr4190834b3a.12.1772281771687;
        Sat, 28 Feb 2026 04:29:31 -0800 (PST)
X-Received: by 2002:a05:6a00:6b93:20b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-8274d9408dcmr4190820b3a.12.1772281771173;
        Sat, 28 Feb 2026 04:29:31 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:30 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:59:04 +0530
Subject: [PATCH v9 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-wdt_reset_reason-v9-5-f96d7a4825d3@oss.qualcomm.com>
References: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
In-Reply-To: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=1582;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=e5pr2oPvUAYu8JAFmPhcApNUXmTIdLegEO08XCkRGxQ=;
 b=FZUZhRg3nwOF1qOCuA9SY+dY+pUmQ+nibWquq1sB/5IJnlrJPyKTC1CawvvK+Nt5lHZ7wsFpf
 4wlQIJdoR0FDfkIPQEEobeUk81o4uQiE5LslXaDBM7vz12wmhPl4FGp
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: HkxkSqxHnWzd0uNIc3Y74Bmal5uQ8Chl
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a2dfac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX58/A7N/vzI1U
 MGASmYzIEpOiUFkGWMtuUhAsWvAy81wg+/nRTkLn1eytBktlcU7mNW1IfOh47zdgkNCLExTPhva
 s9AHdC6pHASeudQNOok5COR6kxd0SwK1D9EdBfd7X4flecVnZjKgCruvImpUPv63daoinJwd/9m
 vb/AeHsft5yN1RD9+HjX1a/MDaGLZyG3fBu/5nvK7K3UKJj0riYJi3BYQAzpOkdqblTBP8ojqYV
 fyfGUgEirLUs7uBfpewwqCOSdlJ2t8o6AlWwtGQHBZvgLgMILdAyWwNk4k21RLAnnoOdI1bkZlu
 NV05TyTb6r9N0dyqxxq6wCBjmg2BIml1MlSvpBbJbQiZK41QFvuuvJJ112VvdWTVzPDZmJxmOpz
 Xrom5PeNKnhK8/367JJ4P0/UaUjnm7YGrzyYLp0QMjSUTsNMQkTpzijiv1fP7gU6FMq2fPdZYoh
 OdPTm4oFnu/faf+lzmw==
X-Proofpoint-GUID: HkxkSqxHnWzd0uNIc3Y74Bmal5uQ8Chl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5023-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6E661C2FCD
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
	- no changes
Changes in v8:
	- Picked up the R-b tag
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 491bc3b00494c47c5524df069e9d65bb4654e863..86de974949f48269170a2bfbeb64214d37fbe488 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -706,6 +707,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


