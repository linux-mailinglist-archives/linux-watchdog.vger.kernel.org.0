Return-Path: <linux-watchdog+bounces-4993-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMSMCICGoGknkgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4993-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:44:32 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F41ACBB9
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D84CB34D0423
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 17:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B164279E9;
	Thu, 26 Feb 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEevgzM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEjFm+A/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C3426D29
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125201; cv=none; b=UKK+6SGVWUgxlU9F9OegqHl0LDGHu3QkUBqiMIIdJIURucp8dtxVyS9M9epCRevIVPH6FXIG1pYadvXYRmpbSRUfJ+GBnFN+BzPm5fAU4zztSidtdcONB5aMJXf7xy1pJ3CnrGXJms1fV+fOdDPkQdLVzP8M4N1tocRq+Fyo2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125201; c=relaxed/simple;
	bh=UBmtfe6y2lFn2YfwGGQWqaxJh7nLnzFJWoEmZlTL8Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfTtvj4EBW3Vww2m/iD8aP89GO91nyWQ564LJnyhSca1pPh6tpO3Ilr35CtNgzWegNDztNkdv5perNL3ep54B95DJsP4oXzxWLWTImDpBoHbHJGMjSmJ0E7P/Idh4qlgT7XA/HTy/yIbQKBuXZir/LzV/SduhQLRpZd345Zx9f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEevgzM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEjFm+A/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGhmwm1176538
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbTDFr4m4H0emAD1VZc/OicpMaPXVXr2M8Yl4+qgcF8=; b=YEevgzM3EbKQCUqS
	uqcqKoDgTMb2AUqndbJv2R0p2lRVl/A8GHO0IirBJM4pgLzG532bfEfQZhsRlkFh
	JkeUjrxcsAt0k+8SuCKLcABp5/fX8T0hlIujkWsh1nDVreR/es6kDK+CalPA2c87
	RNPfQWdZjPgLFDx29f++x5FfEDa4O5HWGVxAMfxw8J8MKwKrJYM44c75x4aMC37e
	tonbLHNPMAscZCkJgvvj0skj4ZxTW5GcROzOHXE+ldcEVD1hJRrKGY4dHgQWGyoG
	57KECznHJ23IZ0UHgUynfDHlRcFc0Gy1HAiEvmLa1Wno3sMkghOOaFjAFoclLnZm
	lXNO2g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gau4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824b42b8a81so3738060b3a.3
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125199; x=1772729999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbTDFr4m4H0emAD1VZc/OicpMaPXVXr2M8Yl4+qgcF8=;
        b=CEjFm+A/fif/Z/+Idspq4+KCm/kYPpfxFyRJufztE0+h3ijn6r1iiQM8u1j9AxlrA3
         h2TaQqaPFYMuLzpd0snz5uCnGoaylmWNhOP0ljxCm6VscoG1mK4JaOCQ6erIKqs5yi3y
         XXNeH98s0ohcKGD3TlI8Ykh90Qj6DWot3Y9iC0enzscmRnq9MML+lRdIJ2GAfdZzfoSS
         uZq6+t8MJ540xs98JUz3XKZ3Y9+0IVA63mA12mLh+IIvvDWnV8PLFnvyOyoRyVuu9wP9
         /Zkonv5nwanpRU6Bs9h6oKQ7ZrPMMb18RWRLw7tvJ0TImaYv6DfiQH/vCSVIhFHi5USO
         QswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125199; x=1772729999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbTDFr4m4H0emAD1VZc/OicpMaPXVXr2M8Yl4+qgcF8=;
        b=IUxt3xcyGf1q0iCNdLxBEYXjGw9pBf7DQZjWGJEQItFl66G5IvTV9jKdq/0gKPWKua
         a3SHlyR5NrJFou5XDxnaO4adP6yIbkOtsnPFVJJc3V2IK1q/WhpGqJgJCnlEObCHcyOo
         jYSwmM69oS5KJ65Y2XdJQQADGfEUbVcI3JFlA/aPpywiVLDrGEIdtiWkiF65YmBfrepL
         AXXanHfMnRYXDiLby5BmvP/wjXOYznuN+ukHCntqHahHCN75H80XlPjSNiDB15kZdcNs
         B6X56co/UelWH89UbHQCasENROI5LXd48YBCBGb0cl0J3RhiodpvKLv8Dt1IMKF1ov1k
         xQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrT+Bn50KMiXDAf76Ikcy4BihXwb6ZHga9/BrVgYMZtn194JMlrDF9wPzjKAiB0TkT4kS/sz4HV6Pb1d0Ehg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTadFeWrJahhF5wtFISjuo/N8bwetwqErnumA31/uTKkmiWWuE
	wtjhX55FG7x+wsjUpRGfaM304WEy711IsSrNzJo7bYQNycXrTESGICarH2s0/Zfoh31W0o23e83
	bNkufiubARUXzVMspvhXiqRHSMMSbBynVl0keeALGGpjVZncwZIViKl/c3paZqcUnJnvNSg==
X-Gm-Gg: ATEYQzyag4XZYuulCk13I8CmlUa30VAkNZfQOHmIU5LJAC9cETAt+35MhRLn6SKxuHn
	P+KZ/CjD2qbSZvRlogfmoZAZG2Ctq1OgIE9RRBEJgCKM70yftx7Hw03qGy8ll2PUh2I6EAoYMlj
	zfzNsO1QmB68CpZBBmBkhahASR1TrK2lhTdW21im9AF7SLGbPwfdoKj8s+Wli7KpGJJgToAjwDR
	KGQ+SZFPfNTabVk/JTSBdggZbfG5kYNaycLPk0zFl1vMAcK8q/RHvNhUof8vCLcsN4Yc94QxToo
	MXOy0Dg+jz6mk8E7rT8QLXWiKSXAsz2GeRpGWXuobiu5leuItT+ke9XGyY1dgKA7IQHV7/k2tgT
	OQIH471LPuzXjU3F6TlymcCWyqRNt5UKPHIoYT/mFbXdLMbJLMooLGMOt+DbOcxFTxJiJ5KC/45
	FK71oC95V119S7KpYLsNzZMF3Rp/eLrrzlLqJ+qcEI08Jg5SI2HX78B+4W
X-Received: by 2002:a05:6a00:4003:b0:81c:4a92:25a2 with SMTP id d2e1a72fcca58-8273bfe547cmr2654336b3a.46.1772125199075;
        Thu, 26 Feb 2026 08:59:59 -0800 (PST)
X-Received: by 2002:a05:6a00:4003:b0:81c:4a92:25a2 with SMTP id d2e1a72fcca58-8273bfe547cmr2654304b3a.46.1772125198572;
        Thu, 26 Feb 2026 08:59:58 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:59:58 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:38 +0530
Subject: [PATCH v8 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-wdt_reset_reason-v8-3-011c3a8cb6ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1569;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UBmtfe6y2lFn2YfwGGQWqaxJh7nLnzFJWoEmZlTL8Kw=;
 b=kenTv9PXu+iI8veG4OtbUgMhroJNO2MX9GXFVzEVOmzITtKFxJBLzMJjj2cSt+BgAe+fyEAWo
 L4s4zoe0gZDBQ52EVrIqX4lLXkrJDsDjslvn5p1l8tzBKhqCmdpECpc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a07c0f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bt_IPO6jKyPzq02bTywA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX+d0L1GtsgHyg
 2KVe9kdXpm2hmHHvJ8PKZSGCAwi5HqpQx8NDvDHyWlxfLZ4WH75m/mAw7IoXI557DaVkxd/Rfmi
 0CjtMBmG6+zZ9KHK6eBGaYcfBY9rXftNJc90XDnYxuCBiu7I8pvH3rgjtSuONdCxsFBVcvkFiNf
 K9n1NQMII5x0VRSFt8jGXfKliVIKQnZHVBB+PI/k0xVfnJ46r1ALAJ6Thhce2NCOQZsu6+mJopl
 BsYfV725BPudi3bqDA9mItHgOP0s0xaBPArOZ0qDbOjr+JVxSUk3HlJhvURY8Rlafo81gOj+X6F
 1FK2kl+veHG0iJGwgctRDL9srJhu+yUijDD6s0H3YIwkAhKgkUkZ0m2fDTVBpxsdY536dqEkmbq
 IOr/J1/9003kqMlfvxqkLPub/xOyNN3LNXaaN5okq91Am7yJs6dS/SGY7ucbuoX62q7MidF27ai
 J0qOx3uF1tJhqVefCuw==
X-Proofpoint-ORIG-GUID: qbwue71xNI-GVYHqfS7bYpHsHnzM6NtN
X-Proofpoint-GUID: qbwue71xNI-GVYHqfS7bYpHsHnzM6NtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-4993-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 818F41ACBB9
X-Rspamd-Action: no action

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	- no changes
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e8316ae88f8078a86043a6d04def8..3ead00da3cd6ffa0f6102179565723d4ab6c2929 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -84,6 +84,12 @@ properties:
     minItems: 1
     maxItems: 5
 
+  sram:
+    maxItems: 1
+    description:
+      A reference to an region residing in IMEM(on-chip SRAM), which contains
+      the system restart reason value populated by the bootloader.
+
 required:
   - compatible
   - reg

-- 
2.34.1


