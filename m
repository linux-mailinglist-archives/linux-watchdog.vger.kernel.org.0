Return-Path: <linux-watchdog+bounces-4861-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIWgCvKLfGnvNgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4861-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:46:10 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0FAB97A5
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C9FC303F04A
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A03A36C595;
	Fri, 30 Jan 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZWJMM/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9/1vo+I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4A37474A
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769898; cv=none; b=Z9sVsy04HBcom7U6bQqMmcO0rtizKMh9NJLJ4K7itxMBpksyJjMlfsvdp/BD3DdVO6NBB0/cMZdXvHlOyd7lycyUEAA/K2lvC8JVQGJtMqAp2MwwQWPhcStYX/9j8am8/6SQLupnR3e2jfVCqsyZOI6Sci2I1MwY9eHvEKMjXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769898; c=relaxed/simple;
	bh=KxBK6OjZJkiPEZOzkNjaOpHTYNYoeONVokaK5mjjISo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRqM3WYhn30iRvgMH46/HgIFcgnIKfbiI9rdLxgiv8wrNOIT8gdm5IyjoWqSf/9DL4OBKE3E93VasNPMAv3rdnbulmt1YvlnCWcsU4i7aBz2YhAMFnvYmT+J0xZJHAcXbUqDYbQoan1i/fdyOeICMwUuuO8IG8H0sSgKN7TQs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZWJMM/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9/1vo+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VZPv995888
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtG6WPTcjzLihlfXarx3roIi0Prm8xlSM4EqqyOsOmU=; b=oZWJMM/umxwz+wpn
	QkAHd4EpQL/qKIFmAmRZ3Iiqb349MyajTyoYEWScmcCK/rUtfq31qvTaXw3T2+DQ
	ZZPc41UZdyem080CH4e/XzNXgtRMdAIh686z04L1XWIgX+l87kmI7yts1MIcfxNB
	MbSvOxoYLHbC9uyfN5iqgosiNhUuc52cmmLcSwGuj6gmriyQEpPA4oyInSWifpii
	mVRV5QjFs0OONMgr/Fq8Y3oGqlRoHfPAbTBcXhzXp+cW68iwMf2wGQSpfzAPR22r
	JNwCLvBpO5rFBIep5LvaE5LYbrp1c0eUatbLcqifcEKRSOUjddT9XYP9CjxHhex2
	QuiDpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvjsmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a13cd9a784so17968685ad.2
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769892; x=1770374692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtG6WPTcjzLihlfXarx3roIi0Prm8xlSM4EqqyOsOmU=;
        b=K9/1vo+IBcWjl9XqkyXTpEYGRUEdPH/u/iZPErtF91rmInarW6Xv6sLnAI6JyS7uyP
         4AsN/hb4iz2OyN9wVWPHYf0JS9mPLXcn7ypnU9foVnzd56a6gD7Ei9q8u4u+uf5pnaM0
         ZauMVDq12/gmXxjf9XjuTKn6mzminlpQAhBdI+4LAGsXjrN9SfAUoAd+BfyNNVpTrm9h
         wz/wB80mdKs+ocN5NZfcy9zd4TN2l5KIu6QWgAI966Lxvr2urPXCt63BDGBhHKYIa/yL
         +q4zXaNrdkSobuV9xo8yDLtIzLxKcBR6qpzJcUNmwI3LrSmuvviROfQXf0FtjFyFxmFD
         dRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769892; x=1770374692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YtG6WPTcjzLihlfXarx3roIi0Prm8xlSM4EqqyOsOmU=;
        b=X2S5ya6rvHItPE2WIQJdYIhveq4wQex+xz7uiMqInhanWCr5aG25a2KHdA633faCOQ
         KHhKGCEvr7YAwUpQjHQ5G9yrTECc4ZCl6sfsq31/QbGgP1avIU0kAozoecRQa3XEI6mR
         aFMO5NbTwFsWDERcWxOwoXFbG8MaUUhoC3sH6RRSMTitQiCdQeS/WjdUpq29D6BeL1qb
         +fdMZ+IOa/K8WgGmjnpGG2kYPJ04FvEEcnf688bL4VWqP36iEj4gwsMk5hG/noh3b2ng
         HY4GYSJziqOqlKWpse0Tr5Y+9sbr8tcXm6muWlifGGWY2Au76ycE/iyJOTgAuXgtklHQ
         S4mA==
X-Forwarded-Encrypted: i=1; AJvYcCWLuv23687WH1zBeXNs3i/Y41KM26n57J6fxBaWmmodK2Q33GubwX3Zv6703s0pihHy7MnI465dcig+dOeb2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqxTVrezW1GD48I3Zw4T8KuOTdMlIowiaeOXN6kvm5GROoHzs
	mDjDQ6JANJQjVy2/u8VA4YLbpEcXE149YfmUHdKueuKNj+KZlmdPBqJtXdga6PAs3FSPjVRQEcH
	b6Yzv5qbrTC5m5vxif71/niDNPP0hUHtLFKaFWnbzGPq1FKFXuTw31ewLnO9DlfuSqsiouQ==
X-Gm-Gg: AZuq6aJq6rJjHRggWKNg/hTuccnVs4L6qC2EuBMLi6zgVWlVguRYQLUUZ6I72oc69oL
	rKiNLqBmyULNQ3DHqCRZNk+S31pf3nirHKfvhXNTZUvvTtnC5WuxLVqdxft7gq4ozlGqbx9PB4i
	wjoWVdqSfCe7tXy2malJnXAwKEa0C4R1N1KAV8tF0BmpVFq9+GttW9JMAKmkhZJ1KIZHNO7dDNT
	+rIldgx2M5IXTY7P116fRhYeweBaUhn3zYEnCOViC5LHvQ4xK2oY9EfRGMcLHQabDBfu8MyL2NN
	KCL0j+TigOlr4wTXM0CjIzYlJ8hXsVbes0oBDd72wpifXdGoaCL8LDdGY36WMOWndVhafLpQNWU
	5noi5amEy/o5OA0XYfTeEKRsOw9YizOLadHdOkBtVjjqbq7tMlInRVpPaCkWfKzN3hAA3I08gdO
	Y1YvgJfyMA+TMHzvvWEtmWUk0b1xjx9TIkvuRn8lEglAZU
X-Received: by 2002:a17:903:3c6e:b0:2a7:aa9e:fb40 with SMTP id d9443c01a7336-2a8d9931888mr25169805ad.45.1769769892085;
        Fri, 30 Jan 2026 02:44:52 -0800 (PST)
X-Received: by 2002:a17:903:3c6e:b0:2a7:aa9e:fb40 with SMTP id d9443c01a7336-2a8d9931888mr25169495ad.45.1769769891609;
        Fri, 30 Jan 2026 02:44:51 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:51 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:32 +0530
Subject: [PATCH v6 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-3-417ab789cd97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1446;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=KxBK6OjZJkiPEZOzkNjaOpHTYNYoeONVokaK5mjjISo=;
 b=B5HpoQVIZqG36Y+r56qZZrKZM0ISsrtvif+5v5NInl7DrUJMiJD0Ay+baCRhibY6EMe9VQjk8
 fsqzAlGKGdlANYSz21JPvRJYVUJxEynGgo7traqKK4rpkZAdxDxcc9O
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697c8ba5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bt_IPO6jKyPzq02bTywA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ZQN1TN5xsnj9U1cQ1uN2YrrFbXRldjLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX7DWfIGdZM6Js
 eQzZFJgXowtFx/d5rZeN0ewkDaa4+PrV8sOW5WQfQEHJrlui5UZjm8EsFH3gKQ44xfsIde7IzHU
 SOXNAAOLhyfi9ipLQyu6AKBgo4pv0HkpWxyEGA9WkycMMUrZ22Nx2/wYfQqmc0dwM+eNXASPY1s
 QKh60vh2QY6yqqyt5wW7t1Gv4kj66h3W3aXwWvRCu/7d4G4zthy9FdMLjUMHGiH3f9usOd0/NN2
 vph1OtF4bBlz+fiG7IQdiux3AES4pmbj5loQ+WuSu8gSWYZ9pw0kZkksuhxw/d+R78On5apgsck
 gCyEoVfu/YwwpByOtzuclfVXKspL6Wg7RAycrZ96uOx+sC5R53qxaaafU9tqJBvXh4N/NUan0aU
 SCHHKMPuvzc0M+C2hkYAky7m1FdAKi0c7ST8Ts3uQMqdyEQQ4gIffaoPcZz04ai9XCDTFtZXHlw
 gTypc9oTKy31w6GzADw==
X-Proofpoint-ORIG-GUID: ZQN1TN5xsnj9U1cQ1uN2YrrFbXRldjLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4861-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB0FAB97A5
X-Rspamd-Action: no action

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
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


