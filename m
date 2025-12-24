Return-Path: <linux-watchdog+bounces-4734-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC5CDC08B
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 11:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A4A1303D9E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 10:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF19731A050;
	Wed, 24 Dec 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nc3TuhcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hg1hdLoH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC253191C2
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573139; cv=none; b=Sx/hAhqQ62XdPoYMIocBhty5aR25RUMOU+ZjJXs7OOXn42e+312TF0eH/EgaerDBoQ1FYwe3wpQbNwO6UzzIJHFT7xgUmm0t4FSGb0tgUDSSK5eA7fn7DGibLvFUMB5i8ZhnTNtoGHYh+Y7+WlvxKyl4Zi2gD4KReqADLYIC6sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573139; c=relaxed/simple;
	bh=nqQivijX3tURXwG2DhlovpvYwn5frwJQUGpzB/oBX1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4h4FfPWO00Zhof0gSJ00C7sLpm6B+TsuVlWc+xNWx0LXuQROBjFo0OHeVuwHrY2uGU0fKm5Mg2yQRhKqct8gaAITDa2430PN4ko9uOjSzVKlYQKX0cuwfe1V0NtPuMxVXwWhOFZUd+PWogjKp2eZ9Jp7L8NqFmWOTKBK+RCOvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nc3TuhcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hg1hdLoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9pume561263
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLseZ2koo5eBCUAcJR2ZBCeHJWKEZLaDNN3DGmDDF3s=; b=nc3TuhcAw0WZ24RV
	9fHkJkn2gkiH372nKePuMTTbGOQuyBInTBcdiuxhwDNpFllJoR7hyL+TkrVXdv9l
	W/artb8KzDY+iuioEFUZDdJA7BHd6USdwEqESX6f7Bf8m+PkCO3LcGUeanioxR45
	D1U3zAqShR2r2EjwM5+JPQoMft36PlwGVYwye46Q1x1dcQpm6pvl6guiUJnhQGrg
	NmmKyUVNGmmS7iVYAPCD3/+xNYMJxe9m8LoFamQ2aY/oWnkX6CZKS5znq1b0ksqq
	2Hh5OQjYWUUnaZ6LoFVanI17MR06gOeYMja/ZUKm8NxzJra8C1lmoMxBdkfJnoR4
	H2HGbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu9xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso148343901cf.3
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 02:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573137; x=1767177937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLseZ2koo5eBCUAcJR2ZBCeHJWKEZLaDNN3DGmDDF3s=;
        b=hg1hdLoHAh+LKMooz2hgyQA5UOMofcXkRzI037iMsHowGfnmYDfrSQZQxZl8nCq2Iq
         yOQR6L1PWwExEjuSs5kC7RWVlPI38dr/1BwQYoG6czj7k8pEgptjPH2dw2G/GuYTdl7E
         8lCwDUwfSq9JccqwBYMLOrj72aTZcWbWVVC/BQKZGl/w3ZC9kKouuB1ZKe4gS87JkZjO
         LYVmCSRPriIla2wGR9/F07bMObLoiIUf7VIPaXTnXAYTgrRKjtrnQROgn21RyhD1aq5p
         z0r9c+nZDsWzbFPO8cotZxosqCEi5uxfyY7p/Rx3jSeDbFcPD7t/VXGxU0dpN2MGBU2T
         nVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573137; x=1767177937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLseZ2koo5eBCUAcJR2ZBCeHJWKEZLaDNN3DGmDDF3s=;
        b=V0apwBNKPL43kuntPVQtTeTlVOQyrZrY/xVrCdLbYAFzG60x/UFQR8VF083uxjVZ2Z
         zN/D5CKmDSsXQyULFtE+Ng/w22p7c5CTGmgYG/48jusOPew9Fh62Vq3vDozujvn+Wb4w
         yV9ItivPL10UDYZGQ1Yb5mem9B3yHYMJhh/dQdY9CB5IVhg/5XcfJRtFj92yidtWBi2i
         MC8jM7Ri8IcyE1bPZfqx8IaxH8Rmzw2Rvh2bJdpDPJcXJiDMriljZSXUraQR3Pn7Z82R
         bP5LwrVDwD6fxo9eP2rq+DzV2MBqVJFVMFc4yigpMdrnJnhiMIaHh5oNpF8qvLyCYppM
         NuyA==
X-Forwarded-Encrypted: i=1; AJvYcCXXTQBx79kiiPySa1xvgxuklFUOdFtbqGuqr4WFeGK8rS0PbgE5jqaOn6zAfD4aRfeL9otV+fWr/MFmofcxXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK7kMcAtidO/WBT8ZKV9RMJQ9xBHVgsntOtEosJ80q7i3C2tDG
	jMN1zrJsLOdKGQXCclYCBq86daXmnJhRdJ1aNdak04T5/aKAcZZSGtIqD52qE63sUrrt/dU+gYS
	LVD5f4eRcePa5w4EeKoQIaUQKSudKux/+6wR8rJsgVJ8RLG9om/CW+7s4PijHK7fITjpKbg==
X-Gm-Gg: AY/fxX5PcjJruAlx/fKW+HALpCDdlDmbrc/kawaT9Htn0P7kzsIoGK4AsyHO8wJEU8g
	E/qfcWxS14U/LxsRljBOvBpsGguFdtJv4DNqMl2nZcNQ9nZqETjUohRg307wtyy8VcdRJfV02UD
	i8XY13nIW3GtzEI/a7CbKQU3YkZYmCClR7gZZsZ9YAdZhOETptaInuloL5tQ6hEeCfBS1kJQo7P
	1rHYt3pU75XpJP8l1Qxs5d+dW38S2ZaixLOvejg/m3goJuOOxSHYE+PYeMaU2M6V95Q7xK/fH/S
	QLABXwYMmI6vbeWVGs+xgWhK4nzWULqCw/CBfRYso6jwXf9pxMVbGcSBSmbcB5jkbXwOm3nRVHi
	efPA2xSabv0clOxM=
X-Received: by 2002:a05:622a:2b04:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4f4abd944c7mr247219161cf.66.1766573136686;
        Wed, 24 Dec 2025 02:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwv80jcppdUyBm76lrlgHFQBgBfzQmfNyDA+QXb75GeakDc5Qkq3iK77XpmdwLyzVP59dYIQ==
X-Received: by 2002:a05:622a:2b04:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4f4abd944c7mr247218901cf.66.1766573136130;
        Wed, 24 Dec 2025 02:45:36 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm31409049f8f.2.2025.12.24.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:45:35 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:45:20 +0200
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-1-1801c55d2883@oss.qualcomm.com>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nqQivijX3tURXwG2DhlovpvYwn5frwJQUGpzB/oBX1s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8RHc7/JTmGnZuvFeiySIeaZH2h48wHK79AvT
 Yl2oKiXG8+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvERwAKCRAbX0TJAJUV
 Vj9GD/9Ud6nklkgjS3khWOqLhGfQZl3by8q7qMHw3jppICIboZ3SMQPwy8Cki27I7VDXeKmkrnG
 PDxxcKcwSE0z5LzXXXTjT5r7AnbmUHye/By1Z5Vs6iXxFPbWpwEtGPs0So19DcqI4n3witNZISc
 /9WIiGETuysN8sZAHO7DPB5ZYdv1bab/LrPDDXU6zmt6KR/qS9li4XoTs4FhYX4bg+dlraJvQ7p
 ztwice2khR0hfJAnpzyP8E51vEIJLy8VL3AQNclCNnGh1A5yx6mmqQsGBpPevGIy8Gx9XpcRbmx
 ZkWmBgTnN5yi665cWaU3DJbt2dRdORKhdvTF6BU5CwDnYd54MkjFfNaScED0m0QKs7iJLqVvyks
 Ugs85oxe8Ni2uDbUdxFaYW7NAI/Kg8/xAeXFZ8KguUmkmwITKGkFjEOEyjRdyLileJ0d9cucvQQ
 pH6RYB+wMguO6DYNFwsbFPEhI3yctCrE+r3r3mdjLU6cxmGmzjpwF0D9KcWe0SrpKBmKKnZSDS3
 66lr2Ls8tUBisKxZv1KjQHtecyXjOBLBYfps5VyrdAa5rrGyD9xV19d79Cuw8rYIQ/4pfoadkxL
 5b5bLZ3w1zzrtANNyoB0w8pVkFswX9SDEXzPhGbw7lpE/L/l+upKSr7o5hImLlOpN7DepOIyUHt
 P2vljh3ZzIiSWpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: xD5wtMfMzQGR9g_ovoEXTcy_Q24XpHcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MyBTYWx0ZWRfX1vlisMt749J4
 QXq5J+brpqFo3eiIKR3DcaAi9q0XPyTLYL2AVgN5RyK2oLvwni3z/UYfKZmUtQ33Ddm9/+kl7Sd
 GCxbsHQAkl0rLuaPj57k3fqnWjErCvZfQB9HNK7x3N7wGVKYu4PuMY3ZLH/ZfyuBkeeyZOARnzd
 lwT9EC2TW2hRQq5iJ4c8aAf2Q/A4wMvpnkdKjn9CBZFm9Bd8o9MjS/aosp8Ze/2g9SQRj3gggfu
 7Q+HMjYXf0U5BS/NPpDwERW1sL49Sk/lBiUflah3fXI8baIj1RN0PLQtTzTfIeXiquUVXCNk+2q
 RIOWZytsfkbQDEzQaAlS8oa2RwEW6SgCK+hBKdom+MVWYPAaGDhfuSofmoidcDU562MPIlvnoz0
 kZbmyXYkTf+z8moIgy+hYT2uGK5HHYL9i+G0TLjnMRuEybH9MYgUbxkEA4M/YSa4C14SJPeWH7s
 elXR3keQ0BopwWmFrOQ==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bc451 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8
 a=b9FoeKhDW2wivhjuwToA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: xD5wtMfMzQGR9g_ovoEXTcy_Q24XpHcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240093

Document the compatible for the X1E80100 platform to the Qualcomm watchdog
binding. The HW implementation is compatible with the KPSS WDT.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f2c4bc900e5f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true

-- 
2.48.1


