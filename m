Return-Path: <linux-watchdog+bounces-4277-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05107BA0AAE
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 18:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8FE71C242D1
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 16:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23C830BF53;
	Thu, 25 Sep 2025 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7a2QSA2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC7330B51C
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818455; cv=none; b=IiAYQ2P/EGcPakvO61KaTBRwX7Vch5ACgaRlsn6joxXy5fJfRe4GIGXmQOswWZmAIhJtYmWZthQX21rcq5iYmjSr7KWrG4AGTalxdybv1JnXJNx9vQrgqh013X/FFHOZjec1AkO7Jqy5xonANRps2J1xpXnoEPmU+ymrDQJ4h4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818455; c=relaxed/simple;
	bh=5bKaIyYtkl+MP8Bbq3igxb/jXbBeVFx0aqkgSriTev0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vev8Xc0DwlUSqpdDDpXxKGejber87ma5YEVWaHLjWX3EFDwd2+4sYXV9IDwCUbVf8aw/tqNEWquhZ50SUeHN72+sjPx8td2il2i1mzo6Yzl3wtZaJ+RIeMao9IdQIGWZz48dOKfMijTN0ALEN+/ZVHUWy0biSTQVTmvY8HQlUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7a2QSA2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1230244f8f.1
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Sep 2025 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818452; x=1759423252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=;
        b=e7a2QSA2TOGxL50CH7x8FYWAIaHtCmjWVXSJlEEaHykFssFgAUUaSzl9CA0iI3OQd+
         S2PxDRp0mhh53lnxRnsuXgT7N/YMqMtrdP0E4ZgdYfeTDMa75XQrt4mnTfihLKNLyTr5
         M7rgK6KPpL6A5Uq0t+Bo+53aXuuABxmePeJkVPtzFGf4/JG1GV7IwoG79CG/3cibaJNM
         dSHtqTzgl7frw4fRw5y7jb63Qc5gk11Cz+PPnBpQjYCiPuH6HrL9UxCK2GYWIygZCn5K
         lNBDOjU0uShScE4bwA2qLeJcG3N1lmbhhxbYjxuBOIJuICNU42pi93ajw0R7KE9jNBaY
         Zb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818452; x=1759423252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=;
        b=pNLb7Mf7mnLHW7Q5qovZ+pthFrzI9O7eDTGaAaM3clYB9BaFlNGA6H0qNdhJYd3OZS
         85W4ox6zWKze3w4c6sPKeEE7K6snT8bCeNNs4HANm2C7qxIex+QkhpjNOMVuZzDw+89S
         25jDZuGs51nOyxuoIOX+Dw9udl+tPJITl9hjdyRi43NMk0rRBT81nFE0HdnB4KEFUbCF
         OkkkMobWt0yFZgNu3hSZR1sbrvuAqlTvYU4JsIhp+rbomRvhtgkSBgMxfiHW2V7tb3eV
         tLJF5t0s/I2bhLGpNu6zTVZIHTkFd4WLPEKY6Jd+coytlkJaMfTqZFk6xwcXXfZZa158
         fF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp73ZWdLjDZQfbRZ8c+z1ht2/1qjM77U2hPcePTTMXN6esjEZNvV54t9OuzweqlWDrgMtHjsjTg/q0mDwR7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPupnrHN4Yf81LgjAdN/E/Sl3f54mhFcMuqPmWbUsXRSEugCHC
	PvOE+x+dqpLgXoZ4hR3uZfccArwBBAjznTqw0a+zb5F7Z8Lr0IbXgolc
X-Gm-Gg: ASbGnctv6TbNTK6R+J2Rr3+TLZ0qcQV3YoetSvLjPwIZ2i1D0l+FPhDEA89ckUnkHrb
	tVKSlC4/EIVuFFpUZdkV6bipKX7kfCFU/Y0vttPWm0wp0bII3JG/w7Oubv08HNv0Cv2ETN4iM80
	wAoV0/PdasmaCKwFcAhj5WwwGky9Xn9tgo7Od7T8+l7g4f+krYPL3P4hb0iSiNqSeFIKI2se+eX
	KyDbbfvLYfYPDCtW26Y4OiAvHjLswI8V7jqtWwXr3bF6A5TRuqNC9gyLs8hJk7qEqA4YH8TJwF+
	Lqfqk3mMoDpeww5NEwJOAkPZl19TONiXUorTelSey4jwmfaV2W7K+0I+pGlwHhzB5APheYwsEfG
	PlhNIPEZjY8reGGVb9tKSI2VnWR0cUl42HPnYTOwMY7Oid5YFStq3mwYL5CxtCPcMkLFJKPevoZ
	Q0V9hO7w==
X-Google-Smtp-Source: AGHT+IFuboP96UTpd7Lrf1lzxKViS1D5GdrbEgDmgGvbVgns+3irooGx/K0KSA4xhs66h89FOOvM5g==
X-Received: by 2002:a05:6000:3102:b0:405:3028:1bce with SMTP id ffacd0b85a97d-40e4886dea7mr4262966f8f.32.1758818452397;
        Thu, 25 Sep 2025 09:40:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:40:35 +0200
Message-ID: <20250925164038.13987-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
index 6bbab3cb28e5..6259478bdae5 100644
--- a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: airoha,en7581-wdt
+    oneOf:
+      - items:
+          - const: airoha,an7583-wdt
+          - const: airoha,en7581-wdt
+      - const: airoha,en7581-wdt
 
   reg:
     maxItems: 1
-- 
2.51.0


