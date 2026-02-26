Return-Path: <linux-watchdog+bounces-4991-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKUqIaB/oGnWkQQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4991-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:15:12 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA41AC071
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4A4334C6172
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 17:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AE0389E1A;
	Thu, 26 Feb 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9vjCa/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcFmJMuE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978B9364955
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125192; cv=none; b=tIjVCnGYhpKnHFTKzW2uwrj3wb6g218dRARF7Sm5wRzfIGHxuz0WEUTb6HNgRkrkKisAuoYtneDULmbDUlveVpmzSbfhHrHlEllUQBSSkLylnfRFYhziFM1n0BfF7YT1ZcsGkVDFrtqKEsfoCmyMP6KRsPM7EV9Az8uhRTbyl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125192; c=relaxed/simple;
	bh=1nf9r25JC3wCUmTdDPwcGDmYS5dtLGS8bBXewEOeDV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzWVw1MrfD441rXp6kAKC99dHtExhxEborKYl3gnhxWa3jsaL4fs3a1uoJfTYEVxY2d2lkTfnnDnHre2E6hcoA2hgr2qXDBkjwNczHhP6zJ/zux9Hf4xTd6AazkiW+JRVbdt9NmOqJKr0+UxsFuc/CsdEM3SvHlmtwi9NBJ5pC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9vjCa/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcFmJMuE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGix4t2518315
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ddaq7w6/Dv8LEYsRp+9+T/nebioMANU6ECj+iROzaJs=; b=e9vjCa/AWAtRgvv6
	DBMpjlA/tuPpmQc30WgCRceydmdXcD8WLvNP/M86ghC/PUHPrT7mbem3x4m/thSz
	15YFS3VfW6b04y9PNOpsyKPFTyufBsNkDUvEmIsGDoqmxKDvY/FeMzCxjOlK4PGL
	ME5yiRr8ixwwXyo04qZrzu3MsjlKmw1VOWqClPFEBlqj20wALuYQAxyp/ed03UmM
	D1JnR2NPwphi1fcOxl+7PvII3Cp4n3LJiYAQ7FuhI/Q8fY+hoFIF9RIFZrn0iZSV
	gPiO4PwlIMKM3d7KH8/7URZQnsZllN5y2+Gau66UH9BimzkIn1lxNgfFuENxDX+B
	v2b3sg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4v6u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70b6a624bfso611747a12.1
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 08:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125190; x=1772729990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ddaq7w6/Dv8LEYsRp+9+T/nebioMANU6ECj+iROzaJs=;
        b=KcFmJMuE8nNawbkjhGfSdCsYEanyXlrFNZ7r1SlA6PiWmXEhhidVxNHYFHLjwoBTQ4
         DcE6lPTECbEgdBLgCF7lNl9mMEUvNMyxz5PHlunC48MTa2doo/yU/2UMLqQZHEgHisCS
         Zdxu3pP/E1FxEajr9THldWpzL8ZvnTjl5A0AeQTjtBQwF4n3F71V1+Wy2DivICi7g2+9
         hAujkEmZ3FhSFFi7fdSi4piKOtrFxGxREHzHKyb2KpeUPkQLjtE8yOsuI7z2PiCVdCr9
         Lj58s83x2louewZx/RR8aLukUREcNuMULHvIPCumZLZMYCufyz/CCMSmBPNMsJctT4Hv
         G4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125190; x=1772729990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ddaq7w6/Dv8LEYsRp+9+T/nebioMANU6ECj+iROzaJs=;
        b=hv0ZOOAFM2ddAzSx48vuQslwF36hxMH6CUGmR29e9FFo69K3k81olJciq5/k83Fb+K
         VAlOCEBtBjZn0SivXAZRbmd4FJThS+LlICwW//AK8XrPPqhPfMh9jOMhUEFzV4bCJ8h5
         GI2PH4jVNAgW1+JxBsNYdMiw8cQjKyiWARzppq0T7V8m/e/MS5Ih5GVp6LfdKacl1e1a
         O23zE4jxhoZanF6sTycsV7cRs4Yc7V6YiBih4t7WOv2WE+1ZX45b0qmP/hiKLgBe7Idd
         osaq09rH2Xk25A7PElo72fO6Y+3ux30g7RBLB61s2YIebye5BCxndgMuEO2gZjdyeFkr
         UgSg==
X-Forwarded-Encrypted: i=1; AJvYcCVlWJf06Ctnhvow5L8kzzC7U31t8cBF1JAUM3blyikgreW5jf5n3BRfTtsKcZ9UlyQXn0USt7mIJNyhDz+jWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00dju9m31sK27PJZ2NiIekna5bB9iqWnG9EaZjFay2TuGmgo+
	mYsWHs5jkZ3bVhd+DGH+yXi8QxcQAZAlvRrSE5VfzZu2a2nOlA0+wa4rFhxfXrDG+h0z80ZFg3P
	kGmAZaQE9ow8CodWvGL51zhEnjvv+45RSXnmwPebQM5agy7X/PSltMWwdLYijSGqlmoYnuA==
X-Gm-Gg: ATEYQzzGHzJ7uDgEbKuy/qrzPMaFBO6vTewPq3flOYZZ+aUNzQ+kmIV6YLG+q5LJGye
	tfbIX/CBlA5hoyqhNAH/HveFkqV+B9F9yXcTz6OxCCxEgdmxZZv72T6VH5HzhhN+us2uRQ8f8xr
	iQcYWNtCIxs7E/fXyd4ZQiXpj9MPkwK73I0M1pPIOD3S/Y5jEHcWMaewmpHmk/eJWDzExwkW2uD
	Ck5T7pgnbn+YI5yQcf4mrcOdRdIFSeoS6T1vP6CLb4Kp/C97tAort7BFNXhKFtU38SKcuw2Ix6F
	0wgUAUHNGLjoRgg3bETqLHRjkmuRaXCuOYaNfju6NrEpt6m+JjNMd2JSxBu9X+pVtZSfoZPU5oN
	xUgezKM8gg8WzVyulHHZnEoSunlBJ9TZpozZV1sDublmwyJ6MEOPCOUNXRQCD/ACRI/wV5PVShH
	pNf/y9GIebrjRFJcQEFmwB2Q+9bTKW2KF5z7KNm6l+MZCSi3fNK9Ohxx6f
X-Received: by 2002:a05:6a00:4217:b0:824:ad25:6477 with SMTP id d2e1a72fcca58-8273984fd38mr2629847b3a.30.1772125189652;
        Thu, 26 Feb 2026 08:59:49 -0800 (PST)
X-Received: by 2002:a05:6a00:4217:b0:824:ad25:6477 with SMTP id d2e1a72fcca58-8273984fd38mr2629827b3a.30.1772125189176;
        Thu, 26 Feb 2026 08:59:49 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:59:48 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:36 +0530
Subject: [PATCH v8 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-wdt_reset_reason-v8-1-011c3a8cb6ff@oss.qualcomm.com>
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1877;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=1nf9r25JC3wCUmTdDPwcGDmYS5dtLGS8bBXewEOeDV0=;
 b=zW5WiPOVPgHzXOUGHuSmdWaApnGjbJoQT0LPXl1r7SamrdHyzLkM7SzOdO3sLTKRVegetwyeB
 SkVTmYYbqQEB/EwFRUAjs0DE1c+QPHjAZrwuY1JgApnke1opVlcEtuY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 77uM4MN2glgxZB1pTSv0QMpJz3sG6K5I
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69a07c06 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfXz3KmMNSWqZWn
 kL9Fn7p759BDBZkLGkooP0MUSVNwZCb71+zBl7WveLRFByvHAcHkUdrC7vBvprYDM0PC56VxLC3
 Keq5elXIYeFHD8LO3fZAxiPFR05ysCLHUmTmdCVbltWfU8JBYcgEmRkdWpWPaFh4EKNKCrBHDkv
 p86AE50szKNjvPokkGpAimnUPqo83bApyzBGB2gYZ8EGq/afLKq4kS/xkz2S+5SR6QblEYS1SlW
 Oyr3jNtXd2ozTfdICHPyA7tHrh2PJqXVmztUCzDsXYumTrH43ygK1ReqX31vErWtpSOBEeBZO6Q
 /Sy8J0+9f0a8uBBwhXuKEcK52jYIGxKOubj2dxf8y2ziGSEaRkHiCFXr59hdO1QvZR8XFraHmGw
 Dp2vNmmsW1FGcEdSVJyVy8Clv+R5rDFnT+yl8gVSVbbJz6YeasHZl0Cw2RuZG0u/C4TuKKpIGTv
 vkcYW+9O5JB1lLCPcNQ==
X-Proofpoint-GUID: 77uM4MN2glgxZB1pTSv0QMpJz3sG6K5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4991-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6DA41AC071
X-Rspamd-Action: no action

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	* Updated the commit with the reasoning to move to mmio-sram
Changes in v7:
	* Added the reference link
Changes in v6:
	* New patch
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..72d35e30c439ccf4901d937f838fe7c7a81f33b1 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1


