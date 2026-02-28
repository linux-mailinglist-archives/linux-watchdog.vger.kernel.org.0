Return-Path: <linux-watchdog+bounces-5019-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCQrA77fomkV7gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5019-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 13:29:50 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA61C2F6E
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 13:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B2730CE468
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 12:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB70943D4F3;
	Sat, 28 Feb 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVgy9CeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jULV5FHQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1DD43D4F6
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281756; cv=none; b=sjahWFNyT0OgWUuKXjHhC3fR5r+PIYp13bpDciJXbmo8jas7StOwd3OHcIB8yttXsjbaBeppWY0H6eRci+6l/EjXxVxSqdrP25CVpQNQx5dMbbG3p+lFZ863RWD4lUjAbxzK5eljSvk8bMvF+cXvHfZHW+DF57buyFlt8xsXwAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281756; c=relaxed/simple;
	bh=x5iNPEjp2xSfvtFN3vU0//rgfEfwzETin/raI4qUzpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQOmkgR8fJ153YrCdqzduQ/HMYN0xfMPqAWHZ+ENe4Vo9RnA8XV+5twAFnoXt9v2mNlecMlxjvsZZHQnOD9dzuvuUXXxirW8RBemi0h6Mx3cy5IFF9GepU/Qkfu1b8k29ecreQRBsIZ7tCUW+2z6NGoYov5yQEHYjwIqZL6CtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVgy9CeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jULV5FHQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S907mk4137547
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3yR5iUqKqIbBW/cVn6LYmd7ztArAmls5m8vnMq/PpM=; b=ZVgy9CeBKeJnd1v6
	HyqTBozzHMAWcXPp07KY5zY2+FMLCKJ5ZycprniiVkHuLq8CtsoNiFcGoCRIQwzT
	Ld7sbHlzPxy2GHdg3SvzOaR8o28ZB7iCFRckkBmHEeSknxol6nGYNmha/IrnUdSj
	bxNQUOY71S8hm2B2QegdkG8X6hFYADy2Cxfzt1jCzrN8cITKkf75bybm0GftNwZO
	qGovjW10lVsDL9Rrzm3Bmk6/P5J/x7POgVaSr+EXBn3MCGxFpdDTaVjAZ/acydok
	VZr6pnykHkCZmdSv4jwyj/lF7ytxxtiJYtRwGKxwmI66wj2AFL3M4icCwq755Aaa
	oGSZcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8gwum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so21431565ad.0
        for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281753; x=1772886553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3yR5iUqKqIbBW/cVn6LYmd7ztArAmls5m8vnMq/PpM=;
        b=jULV5FHQb3tcNLPQci0fHSY3vF4Ro+0V+YKL2jFYnZqdM/7k0fstFBtGEhJ6v309KJ
         buAR5ydsjq4HdpOiNSgGmZ8WYpoChKmB7SMphsLJAFLQmMQWRf4irbQpE+hp5GS+WayS
         1yIgfLypY9NxjAnUClOEJC6GS3tEKp2YPb0555NOgEGMF0EKZqVfPJf1KloCN0L64UbU
         WbO6iipNARbdLPZx/yIPDneB8BD9X2Mm2dc5wDJP7J0QcraUGE7m4axVVTVV2HmSZK68
         +IHs22iA7OcTYAdjDItElyZH/GKkzCmzZkO8cx7rmFJHZDPAq4BUvhKCZK1p61f1sPBi
         qUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281753; x=1772886553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3yR5iUqKqIbBW/cVn6LYmd7ztArAmls5m8vnMq/PpM=;
        b=ULBVUxzvZR2xvjUd4lGa0fMGU+4GymtjoGpdJE/Bp4P4P00/bJZtlfq9+QzQo3//ut
         4djQZlIE8XO6Tyy3svqmGFTxPeZUN3sImU3IKiZ9uQ0Wj31++iUyW3OyHZCWFlb/K26p
         U0XykMkbvBm41ZaT4lPV2IF/wt2xnb+BfwKIAfVCPvw/5myRoc+GjvbI/uGC0emuBw6k
         Qd9rbLUf5BXQ9NBmIIqPcWGGb5IJaBSQh8OSTzMnaUPb/Yv0A39tljm20tkmnUcSR9Q3
         lT7rxdI5FX8o+ghemS5oFukRIjfrOFQTmDGW7aa4c1p+iy1ZucPuo8QZZzyzVSd3ZHyi
         PC9A==
X-Forwarded-Encrypted: i=1; AJvYcCWH/qGO7WLURoc81tXGQRr9UstPQnO8CGyhcLeesxg0kA1FSUeeARRq3LZbNN+w5kHpKKQ6GZSG17eiOQsVJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJ4i2x02AFsQ2IsKUiSDzKniR/DB3SOFZ5uREAwEBeUQXzZHZ
	c60RTzeMyyG9EecOV90aingbblj09cByoc9RSCnW+T/lY7xvd8ayz22kN9gYV92RtP0RidQk4Bc
	Il+8BqXwIl3q7C/8YGxtYI3lr6tjM1eYZiLIgwhpqAd0A+bOCz4TehdCKM0j/1CpMUFeQvQ==
X-Gm-Gg: ATEYQzzwx+sdGxLzJsmKlFaV2Txb8FDuO8KUr1jM+OPpxQ/iaQEY/m+zBd1PUesnEOg
	qAZhasr5f6kfWTrAkfu10gEeXp3e9O5Ff0rDX4SKvroWm3LIHDwmukTVRfSfY/DeKj7Hj+lM0Wb
	xzYXGCuVthnKiDR9RJLm6Qy/sDxmWL8m5r0Lw4rkHZFN1OhYCTQG5IxLB68kY7Rsb6zC8lEti13
	Fhjs7umLjSDQeQlbjEWtpcsWvlgWVKsGEeIMx2+Ew3ndEkNC7ZI6+imjacHAznTD8osyOuvq73O
	DVfe06h+IRTDxz65jf3LXqo12gKYr0Vl7sOx5CO1TdfhOKKEVe6R2i8c3C9Sr6lnM8EnJhghElW
	o300vKIMcRwFtUvKKXXpUkyEFB2gqLNJk8BgYUOy0tT+xRAwGhNYwIAnRVUMxJfOgILLGR4L036
	tu+GojTjS1tNdkfHolkpNLpLJcxL1rE2eMVOTQmtCc/CUU27/8yrfGVEAx
X-Received: by 2002:a17:902:e78f:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2adf78db373mr119306495ad.3.1772281752665;
        Sat, 28 Feb 2026 04:29:12 -0800 (PST)
X-Received: by 2002:a17:902:e78f:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2adf78db373mr119306175ad.3.1772281752148;
        Sat, 28 Feb 2026 04:29:12 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:11 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:59:00 +0530
Subject: [PATCH v9 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260228-wdt_reset_reason-v9-1-f96d7a4825d3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=1988;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=x5iNPEjp2xSfvtFN3vU0//rgfEfwzETin/raI4qUzpg=;
 b=yaSkId9fnYE1LOoA8ymQ04aHBKxbJ6oTTxr6lO0f1Q7czUyE4NXEinMUi77Lrhlcnv3aaEqG7
 4zAP8FGUAAsBdyDYKAM0TQ84x0+HT4KjhF/8eb0hNSRRe0yXUpr8OQ7
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX5Qko6XV7fgcS
 7fpp3znN2sXU0fdl/TRW1ejQG4dUV+Wn8ktU8xylE34Rdtggxe/tGwGrEqzOic4ruzklgW5tz3i
 k5I1T0cCYxGUrpRm7WtW50RDS/qQoJLhIe8/fifv6XvbFL+2EFbo5a6sHFDjJsKKOyxHYV1iaHc
 CqfYH8In8mCI1xTWNssvJObkHtlm4acgw+ccx76CK7JUgEBnGcqfG0Ww7xAw/DlF55YdhlId6hA
 dAOqXwsjKPZuKhQL+OKFBqv5pTVjrkz6W/9QkFK1NVDGVRbdHCrsRpSWgx5N0/GY8orx5C8Qb/F
 4AZR7d6r9Ma0dmMqs/r2fvDTt8b6HexO1gKpunlY3JLpLrfit91nkNIqf8WX9TYJTG8tNceHsfL
 MfYTxVkVJtkp2mFZn/tvHB6w65jcDSt4Q1IAPgXy3wfiNfVMjq04gkgW7LkzzsMAR6OQSxYt4BU
 fp9AccUEtXpRrcdbmUQ==
X-Proofpoint-ORIG-GUID: qH86gE9VUZYu9QdIJCaxb0zfIivxPWoU
X-Proofpoint-GUID: qH86gE9VUZYu9QdIJCaxb0zfIivxPWoU
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a2df99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5019-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FBA61C2F6E
X-Rspamd-Action: no action

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
	* Picked up R-b tag
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


