Return-Path: <linux-watchdog+bounces-4294-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335BBA91BF
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D051892C5D
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 11:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63DC3054F1;
	Mon, 29 Sep 2025 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS7fUf7Y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F830507B
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146572; cv=none; b=IZf67j6t6NV+oL3QTMoh5DQ83TvwWx0P1fzbfnT6p1T8j0IASAy42NH08iLOOhdwx8H5uBrKJNtDxtwDagLz07IVD6JRe4lFmR3hKz6+TsWbszVXqCTZEZKh8JbujhVHUT1UNmxUV7juey0KDL/XsGg2vkKhOW73TIbpOBgtj0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146572; c=relaxed/simple;
	bh=aZdTsMD9fgmVcy1PAS22fMuqSv0ykQeoRdnEip9V1nc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCGl5czM6rJSFHwJBj9fowq8LdQ0OHal1QaBTRpf6zWRXGmN9S1TSOLKUqzaRHYrmxdb8XIWiCE9dkPNQgvYL93L1P5HUC05QgejGPW27mIGYKHtnr57ddQsxpA36wEbJjeOj5LRRVhuYOPTv34hoPaGn5r6WrD9/hrl8N21swI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS7fUf7Y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so12740535e9.2
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146569; x=1759751369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mIMwirLGWfi6Q5dJnPwjrLRkS6cp6VZXhnc2huda+M=;
        b=IS7fUf7Y8AGuLsc9ycTAdf04Ov29bBf3aBLYx96o59VOzBW6bd+csHnACC1gpT5/ln
         cI/Ohh8FO2lQ6CW1js6/fJZbHaQHBqMm4wGA3RG6XUqI6nzYHl1zX5N6eYzerr6pjrg4
         xXZ+f7t+DN5wQvjIyopLu8SkyHhHBPidHR8cQkPqKBICXyqUlku/9AFPh0UfGCIU3bkR
         yv93seR3A1sHE/UmSsFA3XbUxqugdu7MOvUMDel7qonm6xmluQxFo6r+jOHw1j7yzF5e
         ly1/ixsqxS45aPKIESJ5d+ZWpyg1ANTPorogtBXmkVbfntNiPXmKlijJIMkxkFTMOC+v
         30wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146569; x=1759751369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mIMwirLGWfi6Q5dJnPwjrLRkS6cp6VZXhnc2huda+M=;
        b=NAN1iehhnk342+ym2+y3f2EwiysDAtb8WSBXU/l2uLgf0geImRLlcRa0ylHxFOOdU3
         7U+UE1EYozr2sOZEKucwkC89eF4HlyJNxAmLG1stBCkym/oFPugdfyaygca1jJBxQ/rP
         0XBMdM2Jxi6mjbwHSl9KDugBN5nJafvRWAHfIcaxs68Et3pgEWDvrf+ULVt5NhW4dlqo
         ViWr5gi1EM9ZKILHuGBL83MVVlvOP3H6fXK8vqxNHqqlPiaSfkc65E3wd+54nZEEJSN8
         mjNFIJaQlQNHZubgazznT80SDBjRClHjGlfRb6+l+MAs9NA+sOi/mpjq6wCfYKY9Vyar
         qDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAc8GeegTbLcjkG+vDt09+RR50FRF2P1XC92kdqVVv4sGpuZSYxo3hJFSwS1fvKiTmdF8sNkPQbRJkEHab4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QZg8Q1XxXM1gIfCMe/6/XRW+ci812hKT5WTths6+YhVCGjFW
	NJp5mf7evpJIsaU5QuUAMfGC7d0LWZr/8gkwbLlFsZKRNEHfrNnjHHBl
X-Gm-Gg: ASbGncvYIxFtCePOWTpw1dk9DyXVY+tntkz13TKqIIP0ie727WmPMVUYGUMwCq8n/p5
	FleOhMCZyJ2PMqCCF06WbKHW7/wARNLy7bXWVg/ApjrRCNTqBqy5nv8Owl2BOiiBrX2ZPlKF9w9
	8DOFloHJB517A3L0iGEkPm81olKjR09WtW6ikNUXa6np3RzMhoGEzuPBGQmyBch2nHykdUXEFAB
	QF/p7ZLz8rJgIP1pTiTaFz1GHemb0K0TLxrvTV76HI1zpAXJiPn3Jz7mBoF1CmOFNW+jlGxfWOS
	Si/mvqs6kBIAMYkdaXck7SoD3CrdhkMTC3/zkHTaLTk4xacWlEz+n5pN4yR7fslFLkr8F2gyx9+
	GG0hPumIeSbUqt5/ER/ijx4cMDlWgG3iNFJzrPpkMqQgFEHXSV1MEkTcQgq6r1e3zITdM7SAE5F
	GDDjbyig==
X-Google-Smtp-Source: AGHT+IHHeeXxNQFuhvyiL0e2I2I/uphT8IlYRgLGojEB+ic7yYz9UM+mWAZxKobXSmkeRjFhavSFKQ==
X-Received: by 2002:a05:600c:19d0:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-46e3292ea3emr151179445e9.0.1759146569045;
        Mon, 29 Sep 2025 04:49:29 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:28 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
Date: Mon, 29 Sep 2025 13:49:13 +0200
Message-ID: <20250929114917.5501-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


