Return-Path: <linux-watchdog+bounces-4859-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GgpGK6LfGnuNgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4859-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:45:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D121FB9753
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9209A3011844
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 10:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B79F35A92B;
	Fri, 30 Jan 2026 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoRBOyTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIZbkIIg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A536A037
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769887; cv=none; b=BEZZ2giRPwthbON5RoKCgVz3c6YtW312E4D1qEmqoZZ8+/HTPHYqISZlw6S+HB8ONCKMBWGJEEnfqQXcaycPVvcj1Bnx5S/JCcQg7lTZj7qGLJN+Km6JAytiCqPBIuLqjc8n/OBcknboo15lkKcGXGuplcaPn0XUfkMA5NVm70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769887; c=relaxed/simple;
	bh=1/tlWyaBm1LL+MIjYbt90/qHq9VAdMBrGxS+MfzLnTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oab4v8s9qj+rHFNI5WFfAHjhRaXN+6kbsaKCJlDpb1PsRWDzB34mYFKp5OzBkcS84cIBXVyZD93CWp4dqNZeqGhkAKIqWj955WiECJmqP0pAJxgsGynEaccvmgG5KTp/Qkr311ETNeUAr0dTNqrodD+UUjHMuuOH6xIWErK7GG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoRBOyTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIZbkIIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAAVTE1488328
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12qV8rSZThwrI4RrBfMUZj7JPmyTo6MCq7R8VL3OrK0=; b=WoRBOyTHvhMgl4hO
	GGAFffZljgejpk1+ICFRJOpDwdumaUOIK7dPq3ZOBoKYvhWiyRVRNUjzmGKJwe7v
	DIwkirmGeCfdpd+tSh5KqhvUsYFKyKst44rv3lMk7jZMellOZBNKpsSpQMzcBeAu
	taFKp3d5dwhEvXZtH986CELKLVch4eyPyUoRkkXbbjBQPfD/Vbjh8azYW3fmHpbI
	eeYeBp64LfuxHkKWrxnXWHwfXcRAxVeXMy9RcIb9dDQYCDnyfN3Ht1aVpigacbiB
	eS6Rzf1iseKUEYs0MdBp94veiiZfxwBU+qreQmQ/0uttp+dU7DnknGYeH0NnTanH
	p/xHow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3tvga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7d7b87977so18889095ad.0
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769883; x=1770374683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12qV8rSZThwrI4RrBfMUZj7JPmyTo6MCq7R8VL3OrK0=;
        b=MIZbkIIgv8+K/EgcngWcQm+FifBWOsbhZ2s43g2wIkwCAZzg1acAzzo6WBkT/DNSlK
         aXJl3fKf7VTILat8nBuP8gyhLWX0w+NOyKa8/5LprJGj0c+OGGOChVIbIQpFRnXZIgXY
         68R9rihZfeg5R5hleCFKmXBUwCIdfqXp6JAmwjuRHhzWZKgiNNbubs16jm3MnicacNwd
         UtLy/21070gLYwsFnE4VxR45MR9pY9LJSNnRsLOE3GJ5zcPyrc26saRdSjqV+gx+301k
         n3WdQPaP8bMsvlCcUsoY9yPQIZj/v2CXV0hyDnHl87bwqSDG4kW35lYKiHAOYZhw7dLh
         IbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769883; x=1770374683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=12qV8rSZThwrI4RrBfMUZj7JPmyTo6MCq7R8VL3OrK0=;
        b=rFimOzksXuCvqRo9IvTz5tsXjB0DqasUdeCNacy2KBOriIQpL8gnmUx0YTLRefyL6w
         y+ehlMU6EH191xYzXHO7DIlY7elJEAx7iMp1t8xtds2idu0JzFaopyEUQ+nnl3rYBPUP
         tEbG2CrdOArh6GTeRTLlVPrwEGFGxiVVJl6E8lD5ykS20BPv8/IqTOYRUVGDurntNXVM
         AUMiHbTwjDtjdTOWtgk/RbAVSU5/LGNh3TFXeqADomBCvsniclyXrBalhwUG1812offv
         kmuxyifFEMnOec1MyXzRGwISKbFlhHRayWfwJ+HgC3YPyIpQqkM4F+a90zVC7t8Ircsr
         BOtg==
X-Forwarded-Encrypted: i=1; AJvYcCVMb8CvUJMsgWfOWt88tlNibCmfZ6zKAjBc1jK1Mqq5QyEHH1v6Yp6eM0i+8SbcRf0xSodbEbLdidU6dZt90A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSlVNhxAkYgRPU+ONrjjEtFh7u8PnHX1/zdfPJRBjfg1P/GVD
	c/ggHWiuiUtcvn6eLRjWsvMrY0NZGR9RUqdwTyQAfSRdEEWTx6StvY1fWSVn18+UYDiD1jyLnXA
	JWpk/Aa2lp1YUu2A9U1+iILpmIb7OAYucS2fmypmwQo/Auy7ngqPvU+Uyq5vNSliiF/jbVg==
X-Gm-Gg: AZuq6aLJeDfLdrrfptbAhLJWK1rwluQIHs9zEzPXiu/V+9fxsWcTOOligX6G0akKXB1
	+/snbbbvY9M7YqYfM7Ao6YzScPJkt+z9tTebFd0YbuaJfvGLFcRq8nbDWJA8QT3X8K7mjk++itE
	QW4PImwYhG3N5Cw1q+KZcbMZ61UWICSk1zJBsF75h6OlXffaI2BiG1plubY3ywaEwynHxDKzR5y
	o5M8NGkelUg6fAMVRqcj+PRUolmDx9DBcCErEAMJLELa0JnuCR9S3Xx5xoNrBCKTHf/+N5QZ+R+
	VD0W7p/3Himwl3lvnR6i3+gy49QnEl29eYPCmc5eRnRam1R81DUa9N1VE2jdabS5H4IS36Co4Cn
	5WH6UJQLmepSrkB/VHRrPktKvsKY6zMUjQe0+aEvMZGxEd6liYAPZ9G2KGjxsZbb+i1ntNQA2t4
	NAoEi8ek5aYra3nMzAPUnZg4gQF3zl0/rB1VeShHP55KpM
X-Received: by 2002:a17:902:e84a:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a8d818b7a5mr28035855ad.49.1769769883487;
        Fri, 30 Jan 2026 02:44:43 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a8d818b7a5mr28035515ad.49.1769769883013;
        Fri, 30 Jan 2026 02:44:43 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:42 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:30 +0530
Subject: [PATCH v6 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1672;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=1/tlWyaBm1LL+MIjYbt90/qHq9VAdMBrGxS+MfzLnTI=;
 b=H8IDM5WqB8c5eQfensVcaUehXaAjqNnaYzWs8ng3RBTX3MQ4njQrk++ko+O1giDJGjY7Lzqcj
 ce6afgfBseOBi6Bmy3OYcv4gBEKSJJx6DeVRrTi7mK1bjMshotQqSHf
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: I-F3uIytF7JFFcJ853yqRdt2CQAiG6Dk
X-Proofpoint-ORIG-GUID: I-F3uIytF7JFFcJ853yqRdt2CQAiG6Dk
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697c8b9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX3aN4LaBfta+i
 T3WE73VYDy3BgXISfhgvj4T8FTi4VSV9Pv9Lz8CJkfM2BkaU500XGoV93cnQik/9chxCnoGXraQ
 iPZzzTvDPZ3rxMMRWxmk2iJhNkQ3gbyuYRVX8nbEZQiHkr5NT3h4723gbk+GVriI3KW69QeIlzv
 ygASre9C4q0QRDW3svvIWJ8T1ZGl3PDCAf6GxnuZjS0zVux+uMz7s/hYlZ6hRaY4mQtFU5pwspD
 tgICcmdIJq7cDidwEyd31p04PiF1J0mcBY5NikzNM7qtcKSGvxHz669H9apkRRAIGPMujijPP2Q
 Bu0Wy8rwLs/T44q0JPp27S1WoT7yvXLxRfJRkprYRj+L5LjLxwfPIqFozLd/IQ/G7LMVcypmqGr
 /c2xb3I36eBXxrwzbJKJk1P9qV3ZwJRyaAdd78yW6c0Qh6SXJq/2ojYlr5j6S2lGjxEcIuht3m8
 3jbxIOln9mas041yvPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
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
	TAGGED_FROM(0.00)[bounces-4859-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D121FB9753
X-Rspamd-Action: no action

Based on the discussion in the linux-arm-msm list, it is not
appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.

So drop the compatible from qcom,imem.yaml and add it in sram.yaml
binding.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
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


