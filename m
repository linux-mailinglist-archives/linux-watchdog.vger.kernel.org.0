Return-Path: <linux-watchdog+bounces-4406-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A4BF28EF
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 18:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189B8464A3B
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 16:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B100332EBB;
	Mon, 20 Oct 2025 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o66pUiPP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49549330B35
	for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979159; cv=none; b=bJDhNpbwFR9tmGnnOOCAPIo/N+ny6DbK7G4EYjhYw3hbNb5O5hy/FcensunGBR8mTDGknn4Cehl5Zr0gSk3Z8LcRYxM5e+IlYysZzVx6zbgRheeI0jyfBWmmDCBaIk+8pcVkrcwD8r+XTe7SzQfuNniXlS8T2KiU8GVzMJeFy24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979159; c=relaxed/simple;
	bh=WV3J3Sb8RrX8e2Hd8SGcSuELHFxUU+MYrkFn/KmEcFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amDJpttZ/sP01dKLpMSa24GubTvogJOe0p4maxWn/6yVe76rw64OBVOKXOl8vSgF5xqxkZPG+Bhd/asY/Te8rlbD7/2XYRQNhDFlESYC57vX9tC0t4vJ3qTrAbiKxB+m0TGTfSk504URI+3FO3FRuNGAzMMo0OSX3LYnln1VRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o66pUiPP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4270900c887so470517f8f.1
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760979154; x=1761583954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnU84aG5AA7OlaDbC8ewfHpg+G11vcSgzAUdP3VTwAQ=;
        b=o66pUiPPZkSK94MNWruRqkhkpyi0cvt9Fy51ds2cmHWNFcwYpVb6PwYo7IfDPZ4Qc0
         66A7NN7C5Gd4wKgAFCxbY0S3vkSlKibBJTs7GwYXACef1sCnh+z11U+9KbWsCULaNJBy
         eAQnexGGPLNGD1Sl3YHOmAz8gH5UzH58+4PRLY0NPg4gx4/cgHxMJ+Gbe1prNb80/1Ht
         pjnG2PORNhbNM53DlRt7StjYOmglT930wydXlbl4fUuCeIClaPJUQe0w5nNWDQn3OlHe
         W6tQxqwScQgtrUG/Kk4SGK0NKkPqc3W7EX4W0ucVSkj8T0JbrkuIrbNOC2HTmlGWfYNw
         SI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979154; x=1761583954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnU84aG5AA7OlaDbC8ewfHpg+G11vcSgzAUdP3VTwAQ=;
        b=hiSHSudVcotZcHf86V7EuQRXtf/nskmX8qrW4bD01/5Mdnle4XqSotC0gzwS7Hbzrf
         ct/rbEaHIywQnNY3fcwkIIjimQ5ahT1AM/qS214xiEAj0ct/GbmRlhzAIRFQC/S+LLRi
         GyO+YgvZx3yBexVLePHxgCZ/iC4P/m1cEhSW88+WOiYIG3J9PQxLnqUb07bv1PdJkaqY
         A2CWGvx7tSTKu5T1sxw3cFkNCOG0GGTzv6IibJYoHf3QtWcIZ5w6FRro/L4AHljzVtbn
         uX/t+8NXaPN4hSVMjPaz4f6tIM5Pe8BmUx5f263Br4id7exd+VN+Alpj3aQR/gDegcqs
         A80A==
X-Gm-Message-State: AOJu0YyiJjLnLATExrgFrl9h/hX4aW9KKnr5/rMbz1pWWQNatVOhu8gX
	xzcX/Z2+MW4lCklUb6DJyUop3j6B6u6QYDZpt/qQi04MgXqMzwyZqvwb1GN2ipuKN5M=
X-Gm-Gg: ASbGncvXbfu5AorfVcuzgO2uQvIksmeO3zdv5b70PsJgHRRO2lT747XHtCgVVqb3/MW
	Djy1ZBdEoufUKdqY80Gox6r1ZkHKU6s5MKps0CRdQRPkJjJAscYS34KqaQngnSRWILIRMi2Jspt
	bXA1R/z+K6fBSdglRCqU5W3RdV1h94qVM83CyQaNCiYwzhqVuVIrXUqioi8YEcseNJqWL2onsOZ
	IKvuiig7+F0T5W/MBZGhoQ3phS8TQUKjSod15woJdVT9ICRBZXihecqDIJsNF+fSxiVtYx+AgNW
	FnRsmygSFzriuglES1Hik01+lQdXHr1WQq/rbBQHNp9eEeng2fEJ7TEHykFjciuY+8b7yC35YKb
	QRanQ4RHA2vU/jNryxxbScx7ikxtpc23YjfeEr0SDB3UJC+koPSLTeaxLhUmxtPpOKjjtwsKddI
	2dk0TPbLpgkyGeLxMM
X-Google-Smtp-Source: AGHT+IF+PYBZwEZy8pbZN8kRsdKZQq2AcpQfnMVlCxQFPlEkzb/myAUyLd2oWEemkGVrfgYsbSowoQ==
X-Received: by 2002:a05:600c:4fcb:b0:471:c4c:5ef with SMTP id 5b1f17b1804b1-4749437b584mr1865315e9.4.1760979154529;
        Mon, 20 Oct 2025 09:52:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82c9sm238324695e9.14.2025.10.20.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 20 Oct 2025 18:52:22 +0200
Subject: [PATCH 3/3] dt-bindings: mfd: rohm,bd96801-pmic: Correct
 timeout-sec length and reference watchdog schema
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Timothy Pearson <tpearson@raptorengineering.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WV3J3Sb8RrX8e2Hd8SGcSuELHFxUU+MYrkFn/KmEcFc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBo9mjL3LkGaBxEvHYAXDvaeJbqP5XIgRGfzHbA7
 IQHAsPDzsSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaPZoywAKCRDBN2bmhouD
 1x11EACVw+bJXMZS0LEH2JcYcGdH/0utiWamyWWmZSP1oFAGZ/h6iDr4dMoPJf7hhE0jxp7cQF5
 YSGB3Ob8o2+LwOjYTdSqyUitEC8TopdYh+K8QtLhrJs6hTjNILM9Qc+oufmHqk78jDp5qYCqtyC
 YoMJcJeRIi/6sF+0lyvDosG5B5hTvM32i1PnFwZTv/EL9v/b+x+pFaIYkL8/ac63oqDshPbaFSx
 IZzpue4l9Ph2aWQm/dRiUjjA1j+kxPG8+cxhHbnXXG/8adnsYajuulAMiVhbfwuHcHfLfCJsagX
 NCN8HZXTNBuuS/26I1OlmoBPRfGJ5Yq2w70YiOiruJ46bSDMM2GM/rrWDafKIi4my3+8u/SK6Oz
 CfMnaaU0WX7n3/lbz2kEEIzrMg2AiT6OhffFb/ViE/RaoWjXpdcdPFGiW55N0Rf3A2clnMKXebO
 JjlI98ni0THoZdVrFbfZjcL8+Ez+N0mkwDzla9Tk2nZQ/X4xwgTRxsy8uUwMG+6k0EJ61rYsyD4
 To++LZTBB/p1+rKJgpAAkaXV7Z9TIOr4LL7k1HWiJYFlTziLg0xWk9COA/0ki2mVpc0WNVo4arX
 x0s6zovbCAPh+D5SJOKRtAHb3xRgWPBZAhamr1DPTkDbNQuRSqyUWrpk5rpZl3Xy7Qo5ZRzZxmK
 Py6jWnzSf1vk0JQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The parent node of ROHM BD96801 PMIC is also holding properties for the
watchdog, thus it should reference watchdog.yaml schema.  OTOH, the
timeout-sec property is used only as one number.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on previous watchdog patch.  I propose to take entire set
via watchdog tree, with Lee's acks.
---
 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
index 0e06570483ae..adb491bcc8dc 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
@@ -57,8 +57,7 @@ properties:
       - prstb
       - intb-only
 
-  timeout-sec:
-    maxItems: 2
+  timeout-sec: true
 
   regulators:
     $ref: /schemas/regulator/rohm,bd96801-regulator.yaml
@@ -72,7 +71,10 @@ required:
   - interrupt-names
   - regulators
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/watchdog/watchdog.yaml
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.48.1


