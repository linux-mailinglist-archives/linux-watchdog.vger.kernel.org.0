Return-Path: <linux-watchdog+bounces-458-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6FC8376BE
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 23:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A458DB24F94
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 22:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F243215E94;
	Mon, 22 Jan 2024 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+rueY/u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D112E69
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964250; cv=none; b=cs6DRGeWUCSsSF55bj9DvzfA+44f1y8wEZkucuyXgHH5yk99hgARD/e2tp27qh+LXaNnIlKBNQiFUl19ggxtMy+h1z3rk9NyBxbQZ7a6cN28Y4swhqFK87kRILAUwtekbRfSyT3ygViMrfVx77TRnCbSbit+GcbgHI1WwHkTN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964250; c=relaxed/simple;
	bh=ADcQXaAoCN3feVEUxUAN7RPLnjxcu0Da4xFhPbbzd5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikcHX4F5vu4q48qDnX2BPFaEqHFw0k7qsHHwGXlI6ls5vkrz5nSR6ngsIGou7RptEh0datS/Y06tjlE9hUmUz0Pr5XW04FzPO8ioI3bDbEWW3rum+trMaD/4MWiYpUUakHiFFeXRVO2jxRtAS7We3xczXv6mMHzJEOv/pJORQZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+rueY/u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40eb033c192so6977705e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 14:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964247; x=1706569047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBly9XkHZ0SVFvJINs6dkm8lumCZ4YgOwJi4aC1YyJM=;
        b=U+rueY/ums3yLa+tPEPHkPAH413XgjgrkNiM90wko/POsOVn897uZzu6UmuieY6ZNH
         moSQzOKLGVx8RFDIj9qzOvIU/GhNCPuhG9ZK6QJd8/SZn6rGl5Nj2/ciyDCZFdcO7e7C
         GHtCWLm66ybuQKe9Cpn/L0NaKRM6q8eWQhJsLR3a52i5Ppm7HzklHHM9sEGPAr42pamZ
         DCSWKBfVT+OGseYwtMR3mh1GYRl+tWUJs2tEIPeX85z3/RUDY/VzeTh/td3LW2tHH1tY
         bw8yTpAhQAOn9KedVyX1fWVYvP+8MR9Fhw6GN0TzJUGAZIzqatAHVK3aNI1XAPZTzjbc
         Zaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964247; x=1706569047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBly9XkHZ0SVFvJINs6dkm8lumCZ4YgOwJi4aC1YyJM=;
        b=K31VqyUn+7BgXMtlLbeggW7hOc+tZLeG/FpFuCFmKemzMnl/i2G7p8gbq9NyaUe4GZ
         q86wMyLIQvo841tUwoZMtE0l7mt4bBZgOeK7RrptJJbBA+JTjOo4ImWsZeUsnld6tW1+
         pyIYjAJUM1Ogtytp6NmxKXN3L3Iy5oBZPCcGrPSub8aEV3Mr92EePOnliscvU3jNwTSu
         0Va6WJQNsgufoaVndclC+Hb/Sxjs9q9QCds5oIt2aaR//OQngf9aVFM1Yk1qFVrlTssK
         BeulR45PkirJipVExu7G2D49/dYi5FUkQcHZGVlqmGn1VvT+Jw/yFnrWwLp6rqcubaph
         OvhA==
X-Gm-Message-State: AOJu0YwVoT83kPFzbjf/SBP01pQHsc9bIq2r9vzPcLok+bjOFLutm5lu
	h93L2sHXvcdABDQdIxjsmSC8DFCcXpBIHTqHyWX82aHovFRFgtxb0GYLgYK5bBk=
X-Google-Smtp-Source: AGHT+IGsC8TYulGe/aeYf5Jm4N+xn/nAtZGRWcp3Eljm49ls5iykYPcGcShpWbH/uU3Qy1q7Jmq4Bw==
X-Received: by 2002:a05:600c:45cc:b0:40e:a565:3ce2 with SMTP id s12-20020a05600c45cc00b0040ea5653ce2mr2204825wmo.73.1705964247305;
        Mon, 22 Jan 2024 14:57:27 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: watchdog: samsung-wdt: deprecate samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:02 +0000
Message-ID: <20240122225710.1952066-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240122225710.1952066-1-peter.griffin@linaro.org>
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog driver no longer requires a phandle to obtain a regmap
to the PMU registers. So mark this as deprecated.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 77a5ddd0426e..3970d6bf8576 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -56,6 +56,7 @@ properties:
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
       Exynos5420, Exynos7, Exynos850 and gs101).
+    deprecated: true
 
 required:
   - compatible
@@ -66,20 +67,6 @@ required:
 
 allOf:
   - $ref: watchdog.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-wdt
-              - samsung,exynos5250-wdt
-              - samsung,exynos5420-wdt
-              - samsung,exynos7-wdt
-              - samsung,exynos850-wdt
-              - samsung,exynosautov9-wdt
-    then:
-      required:
-        - samsung,syscon-phandle
   - if:
       properties:
         compatible:
-- 
2.43.0.429.g432eaa2c6b-goog


