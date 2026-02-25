Return-Path: <linux-watchdog+bounces-4980-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KRkJu2anmkZWgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4980-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:47:09 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76E1927F8
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7040E31006E1
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 06:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A053019BA;
	Wed, 25 Feb 2026 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUJ2V+9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIKZBcUK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F72FFFA4
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001827; cv=none; b=BchAAY05pcUfTvIz9pZ8mKtOwtTkjn8EO85O8lUFozZl+YuOwvk6boNAdza3nuujv7WWRWTR+VL7ps9+IY7yY2HuY0DRkh1nj/wMNWyWAFQjctaYWUZMht6IwJBkUPaakHBUAh03wAo6WZ5l3WYmRdvW4/42l/UDgrez0ODXBQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001827; c=relaxed/simple;
	bh=UPljPnwGN02FV4whxe153HvivXYHL2hbqv3xEdBMCks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOJelhXrX3GZ6RicFgue7qb8cVFxl1Cz3M84oq6GdjAa7JUGS73NQrzm6AWTiqi1R04U13kFIKcXbhKo/hccgmIahPRQJLNcoVg/KN39SoH6jkr/fGHRpCzYiMe0r+xiEPwrsjpP5RpccOXLhYHm8zK3972WUcmr9ODiQlNmRu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUJ2V+9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIKZBcUK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OLp3cD2432551
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJigwPyGJ8dCjHF+mFF/TMsitlZdF2vQIcs9383ED/U=; b=XUJ2V+9JWJCaXutu
	RD7C70c8ALztZJxV1QzuHe4Bv5j58MtMvRd8J6gbGCzAJxF3xxHuVZ5o4JBXFcRd
	nvjI4LrK13P9yYRamR65+RJAO3WKmNqjKRBHMkQQ1IqpLv5DIsRc9HkL01wuYqI/
	3zsnvDgXliE6vHFxVjYM3l3xMmmOyx+36DPZ0LCMXXPMBDdp0hQz9Ev/LRtjIulS
	21jLazIH1LNmL6l5amb/t9MKwjDgXsZgjNSZQXqIQJ17wcfMYnS7QQxI8f08fCff
	OvLd8Gpfa5wdcwbWWF0yYqy0RzEq4e3ssXEcb7DlyhKSdre4MjjE+yU4hqBwdlbB
	fvQ7yw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekjamhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82442b44d94so2717347b3a.2
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 22:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001825; x=1772606625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJigwPyGJ8dCjHF+mFF/TMsitlZdF2vQIcs9383ED/U=;
        b=WIKZBcUKIt4eqIaOv0nWj5bpr3GKUeBh+ADyKOMQn710OevgcGTfLoNxX1D5PTgp7c
         wht41cuBWCQYuE1vR09EwwUIC2q5H2iZ8BzWEnnHhSu34XHbRcWb4IPIz6/tvQ/eWRJQ
         nlDpOmq0evWeOWmTr3DVP6ey7EvhAAIRuLQH1GVQ5ejaZEN8EpI7ME3L1aXp7q5zPfIH
         xmrhWJTgTlRbKAi9VDzfpJyPXhw1vD9TMYJq4p+7bSi466+Vhdg/uHaygZil/8tyHO3j
         eJI+X7IfrIFtqnbw1ghbPCkmZDLMATeaZWOaXfw8XtCyT5AcHG5eldJP6BZbtEf00uX1
         RZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001825; x=1772606625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OJigwPyGJ8dCjHF+mFF/TMsitlZdF2vQIcs9383ED/U=;
        b=M5axtWeTaKQ0xWLP3fs3K8bWDQ5EwZQ20ri/FcjO9t2I7a9Ds9np7ViOjRqWfukCN8
         7inMUu8ArdK+UkGOWLREy3ZNil8QcZ7uBcJiDfduw34avW+JdWOI65tHdyTSCL9AhsE4
         o0ZTOXm5YZEdaCzGprLPoQIridTL2UYOY69DN5HYIR0GSwyZYiE+G/T40OvNziEEibop
         PLSdyQwzJIr9n4+4XZ6pwaUCmkVTn4gSto9OIUyQTthcdaqv7RrROoP+TVK1oexj5Bjk
         JBnUYVeA4ur4V93Ss9b9VvUoh/Uz4N6ISJKub6UOAqca1dSFzeTFvSE5ZxbytTCPyGQg
         /Kuw==
X-Forwarded-Encrypted: i=1; AJvYcCX0AnZhQhBIY/wT9WX4NMX7SCL/ohRdWZWD4Za+e+SAilGqVsgnuSV75vsyXLwUyyqaZh3rWIuLW+5XAzdMBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnen2VYDC318ctFEM2xjT0fFbK3vYBn/umXhZ95KU5x07LUe4
	h641wj0aTq+nFfwqwgI4+aHFg2z4iOU4rpcYwty/xtx2XPepfVUc2/eOWOq61MzTMuzAoVC5qKn
	cxy5Qgbp8tTQ96a0QIwr1KrLTOdC66QZFIjvcjy7vsN8HGW84HePuIGHrvtYYMcRO7FUEYQ==
X-Gm-Gg: ATEYQzyXnraVUTErEgB2WrrqKZyy1gb25rEtfiURjZJ4+1hq3BwSonXe6gWtTF4kHkm
	eF08puaRM3qLmZQ61DPyMKXktj4IN4dXOPYt5vJKJ8YcZ5O5nKe/7uXAdHhv2BH5rraX2/Kh3ka
	pRNxwOGX5wV5bW6jbc22mczx7v0EstQH8/8pNSjkNBHCL49KvJYI+VItDUveqYyZZlc4YO7v7TE
	bGev/50WavbHG5EPCfVoSmaOvUhBhXGjGMDYy5M+NTpZ4SP4HqYJrFlfID9R05FRQ7RJIe7E5B8
	5iIBl3dpabqIzwiDaYAlXOoiMelIyCWS4C5dxojHbiRzw6tLJXkla6F7y2YUi6DcaODYzFUPgSh
	JcGLambqdivCX2LJEwIigbb6DxGA6Vn+fEO5ECmT53B/nV1qWyjKc+VVdUl5jC+m8266tF5mXaA
	yOcayvxmJC1H2RUvWS9AefkMd8xYUjtP4/R6DE2JDYduxqm3kCEkAr74RO
X-Received: by 2002:a05:6a00:6d5a:10b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82728db7ea0mr560390b3a.17.1772001824271;
        Tue, 24 Feb 2026 22:43:44 -0800 (PST)
X-Received: by 2002:a05:6a00:6d5a:10b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82728db7ea0mr560374b3a.17.1772001823766;
        Tue, 24 Feb 2026 22:43:43 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:43 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:12 +0530
Subject: [PATCH v7 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-3-65d5b7e3e1eb@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1538;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UPljPnwGN02FV4whxe153HvivXYHL2hbqv3xEdBMCks=;
 b=ZzhsYL4PV10DnVy/EvE4tum4Z897c5DcHgfmu6cWmuAzRpoiWnKg3+FEkkcMDYPmMcF90b0r2
 ZZR4Qtn4KKEDnHpVlD9SZTuBj2cElCwkvWMyQwOGN2nSsxYxlnLg4E1
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699e9a21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bt_IPO6jKyPzq02bTywA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 4L6gzJTB3LeBDbOPbi2AJeRK7KznIvk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MiBTYWx0ZWRfX5G8j58LU45aZ
 j/tf1u3x/J9B5nkKsZKcWSD5gnzcjxWCC7JDQtdbI991vfN6crnncv/K5QaSTkXqHDWQsBUpSte
 d41VUvvmQYMo1qthC8pZP03+TS5dl1+kn+vXaP8GGs8i2BmXXMaKGCOW0lJrR4vT8amGJ9wHjNA
 foRK0s0vsNqxxhoHHYq7PbOFWUpXS/1u2ZjR2VlGk+Dl0OvIvsoqoviVb8ytyFhBAXeAUlh58Wg
 7I+HRP5iipgVlTywNmzNoCzz65/KIpsRPy6l88u1YVjG1Ks/GzcgExmfDbtqLeezwRdQ2gFiy1H
 9Qm7hMB2qa1JUjKISECQ3lz+v21SRvgZ7pLyIZOIwsgX+cQpUvV8leNuo8NkqbhtMKYFlIFKTFw
 ZZHOmXyF+p14uy9MzAmGuQ13cOp/OtVoRvd093DUGcIVDsVCjz9HG0hjz54IbUMjQSOEKQ7Dlk1
 1ZGzzzwzZbg8DeFxr9g==
X-Proofpoint-GUID: 4L6gzJTB3LeBDbOPbi2AJeRK7KznIvk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4980-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF76E1927F8
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


