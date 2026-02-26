Return-Path: <linux-watchdog+bounces-4992-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEvpN6p/oGnWkQQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4992-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:15:22 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7411AC08D
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F90D34CB17E
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 17:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78913389DE6;
	Thu, 26 Feb 2026 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/epo8/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mk/M67uV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A1410D0B
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125198; cv=none; b=f1j3Lw46wozipbWqolR/4zYFmRoPmbx4VDbvw00yHYtjbYXJD6QG8CjL81ROBWAs7E5Lju5yuu2q4IU5QDr5/RSuLTBhm5kqT+JPcozX4OkOvnp4JJrGrz+3HK8HnEoEe3TzW3DxnLBswxBDx2sS74BCWVLym7q3K+yNuW1ZtMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125198; c=relaxed/simple;
	bh=WXyLbdHHmaOuMbGg7y5AY3ajr9TOq0bVXg5HkjDwCF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9rk+YW8uvQbBCl1AhBTmR975y0VHlHXLfHtqtNWi7/G4uB18RxvbmL8ByQOaQF0U6AXJzPaRFYVIewaLvL0k7nXSjks6i7zoMoA5m9nC5ZFOHPgBD43ytogA3mtaofDWWr/zTlMYDQQO1EVV7AC/VUaOiPTB/qTRQqvIaGybRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/epo8/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mk/M67uV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGhweP1171092
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1MQLiFKQb2Y85kMTYM9yyEMENzkMHyVgI924UYJr8w=; b=o/epo8/aQfAqXpsM
	wKTYfhRJFqw5AQgbU8aG6snAme+8eJHAXlV722jVQ5o5jlLH2ZbGbLYXwNT43gUA
	drUUL578QQiSrz4HpbILzJxIeTL13nEIgFa51s+qyQvUcd/gCC8Iv5VcbTi9ayHf
	/Idit6fxjTwkigDbIV6/x3wyyJy1kPYxYU8ZsCcTmXP3bDVQ4aTCC3VdZ23E+D+6
	9XlEDyO5X+HFkc+L6qNpejFQhI9cm8OvIyIuCBmbd3psnTO3xf6/UB4jFgikMynN
	J6HC3aQ5KF46YpLSSCPGhl6y3+xqxfehD88hcW9clz9q6xzQvPCVPlvRVXOUVMFt
	ks95Og==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0u3aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82740488112so1607980b3a.2
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125195; x=1772729995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1MQLiFKQb2Y85kMTYM9yyEMENzkMHyVgI924UYJr8w=;
        b=Mk/M67uV6PXaZRPhfAdv0w3XbMsox21F5Zwp3/DHJtX9WuTLXIWeH20N0W4n3boL/N
         C74ypKrTrKqcpImCDfGxMsiWoNvgIN7OrXnyc8A+GWxr5hux4B8cNot+fCxzf+BIJLAc
         crGHwxfLDcdFx0z5RXL7S58cMneZf5gAqkkV3o7e/gZcFI3hexffi/HwgiDixwCS25a7
         cMM8+28F/zyXrG0aEziIdszMWH9+ujFWM45/zPuSXzNxjSYN0hC/0Cq/+MvAgzFUCnCs
         +4DjlZkocKrmLyTMX5HEEbbShhX+JD9lVOT27wN8gs3Hdxe9Mg/ChkxWAC8ef8j7UUAJ
         YnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125195; x=1772729995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1MQLiFKQb2Y85kMTYM9yyEMENzkMHyVgI924UYJr8w=;
        b=v3Gb7spY79Z9HOQ/zyK8bWPHaQfSavnh7FRptwCRFz3WicS3/maAv4rdBmrqYmMXUg
         Uh3270wBGuyO7mhZjy6+WXpeUs1k+fhc7bZtwtblt1mUef/rLUapZvrE8Te9LhUaFgDa
         mIRSTkno8DteJt6rQeB8Ob8eoh9IO7f2jfuE5uurtmZV2Z3NOnuUklippgPO+aNSiOSb
         I//LpRrgzia0JmzPbsk2viuyTLwgRwL6Z9iI3j7W9gnHB5NkJdzzjt7lAsx1wYgCkQb3
         OAHg4H4zTpo8U2qr2hpatYNkV2ZuLJbGG7KGCTEpjyxJUgn5LWMONWqsrMrFBo2kIk7A
         PwDw==
X-Forwarded-Encrypted: i=1; AJvYcCXGof77f5jH+fX+yEe0MikK1HG77wopQCTooZhXqZptjwaQn9RUwqZKnpJW5+1ZAsud0EcaULn54sCI0sBv/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLW9FirgysYlLtWcKqT7VBxJGhOCmBxUdmvkYkM8M0yBEkzOuy
	D2jNpRJgDfex8q/rsUWASAI1zIL8Zcj44vixFGEJvfqkRsXHvDwRHpTsF/yvgGRdSS2HshSZx6x
	AxDTj6ISQ/1Ub5Z1CibFMOBiDcfulOkHMT6PX34+C6sl5vVHJaMNCdSgxVOm+hp5u4QaSnw==
X-Gm-Gg: ATEYQzyJY6NYfh/motPj3Q9R7lwm6Y0r2QFQuTQXo1YOriXGndt/UUE/heFJv769dkO
	8Q0+srEA7RUaPbKuU9BSs88+ql/ok9ZYPbLCSfLvuuYOumIZzww7WNTUc/bXKUdf9JSQldpcL4R
	rp1qyelJrhcpGubAsxc2TCPf4BewtOC4UeYjDLmUSIzNZO9HW5JeFDVCKS6/nw/nxMS38lFi9Zt
	Qxeh+2Mzd5MAZKn8KH1IGFYJ2cDMrTmzWaUi8KgXnCLsvAsYi7x4/7P6TJeuf8kUZgWduLF2e3r
	vOpF39MSaoSq/pHZeykks0lBQOxNjgYk3Ck5NjRKPqVk+Yaz8mDv6r78iTcueKVm9IPXJXhURgE
	7wKhn6xUaQW/enSuuYq9kes81LmD9oY28G1oDZJYfaE9kBimgB1bBAZishr9Vu4xaNZ2GRz1SgQ
	QM/VM5UI8L+DZkeqEFf0EN9ZSZ1k320339+9ZzX5nscx3ihUqQMixC8JUH
X-Received: by 2002:a05:6a00:23c2:b0:827:37d5:af5a with SMTP id d2e1a72fcca58-82737d5b32cmr3268396b3a.19.1772125194621;
        Thu, 26 Feb 2026 08:59:54 -0800 (PST)
X-Received: by 2002:a05:6a00:23c2:b0:827:37d5:af5a with SMTP id d2e1a72fcca58-82737d5b32cmr3268376b3a.19.1772125194123;
        Thu, 26 Feb 2026 08:59:54 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:59:53 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:37 +0530
Subject: [PATCH v8 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-wdt_reset_reason-v8-2-011c3a8cb6ff@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
In-Reply-To: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1779;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=WXyLbdHHmaOuMbGg7y5AY3ajr9TOq0bVXg5HkjDwCF4=;
 b=2DKetvF3EjZb8u/EVtyleuhpgkKt5YLfhHw784fM5ata8SBs4RU/ky6LZU8HXLM+b0a27VGAL
 iiox7ztdJR3BlrEU2Cw79wKUnsNACZUv5WKs/3arPkWitdVRuBG6yGa
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX1nF6Q/vU7Aaq
 S4iqaNN34hKwEVnih5zq1dRx4/0iYzPuUyXu7RSzg0qiN3Q/BZJNU2FFEwmjHRbHwx/JRieSdes
 xbj6gJZe8qdR3PfQCMIqcTf9KXIGexCNGFjxT18tmwxiJVM0cD18j2rNnv7SJfQ+zwQ6mKOO5ie
 7WoXVATHXj0OkmiJKFFJ3vd5u1NgZOe6be5QLDwZW/Y4BIUs8VLcsxm+Bx/Ls6X0TRxU+ecz5bj
 fn/SNow7DjzH1rANZTVHjE0J1beTMIAWmDfUSdeFZ+8OJCmJVWW81gbSy2bAJxjZ2+i5Ynt/PPQ
 /dk4/3v2jRcP7spNvYn58p1LANSWMt5J0leqk7S7EGg/MGLhUcmyK8lfBnIRyefN5mtaJlcVgCF
 bEY2vlbWaXVOqG2cTQlfpoBxd5vAelMIjvInG32uKdxTnKSNEJck9+Vq2HrD/YsmRdzI67GUnBP
 ejgV+9lzslPOqN10otw==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=69a07c0b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mKhICx4ZKR4LDPD-0BM2BntkFYjyse3k
X-Proofpoint-GUID: mKhICx4ZKR4LDPD-0BM2BntkFYjyse3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4992-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.131.57.192:email,8a00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E7411AC08D
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	- Picked up the R-b tag
Changes in v7:
	- added the flag 'no-memory-wc'
	- Picked up the R-b tag
Changes in v6:
	- move to mmio-sram and drop the Konrad's R-b tag
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..491bc3b00494c47c5524df069e9d65bb4654e863 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -697,6 +697,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


