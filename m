Return-Path: <linux-watchdog+bounces-3405-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B933AA7106
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 14:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A206189E01E
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 12:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF8823C500;
	Fri,  2 May 2025 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRwhl9bZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B2220E70C;
	Fri,  2 May 2025 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187264; cv=none; b=cz+nDSVYN5B+1fEiQrC4ttY200jOQ9hRatloh1gNiDWr7RrXJ8Peh6E4rbgBmuGPit7nCjTDvwUlaDtzKPR7J9UOHvZha+aEmY5vgYevrCAR3fojQRlIkD2LsLGAhpVkleSH+He7aZ1yp5Gsvn67G7qPGdIwiQp6GvJ0moRo+7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187264; c=relaxed/simple;
	bh=YiseXvyt5EgaDOsk2LSViM1lt7tmX7tOE7VszQk396M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KX8Tm7g/Bh1Rmax/+MkZFV4O+iXZOyGVvQCJqQGmUgWl91HEReLF1Bz9VGX0gIxs/39jBTWo8u55ZrI4SAkSHiPigpEX95me/jp/lIAvzcB0ZlpX5aXvr/nzUIwZP9TIfk29Jj7/mNFWS0b4825V2oqRJTrWlJ5xpJYz/d7PupA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRwhl9bZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so18237405e9.3;
        Fri, 02 May 2025 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187260; x=1746792060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8k/UtXhmq/2Qq/msIxhbvQoU2lPYvZlp+9U8Xu/MAkU=;
        b=JRwhl9bZzSBynxaODqWs31QH7ivrIYqRbf+cG0lQj3qKhtvvnydPBefKWjCDyuQhYN
         L/Pd2GVJ6XDSxFELyHBuVwWeQdady/aezflKW1tem0dsekUyz3fQcCeAX0NFsqqei2lY
         L7IuLiFMNQQQbvngI8ChhDW7WtVmNP9otigNARBVced2mf4aQeO3V6LVKIp/F53kOn6i
         V3656yJl+zXr3zJbi31sBdoSgUnaEsK0uxva9aB42lIsfwIoBcZ5wMZBE0epDMz42JFk
         NaTKmPYYZ2NYjEvdqhbjRacEd9CmfIRK0Ixbg7wYZhqjYDeHpKcbCJVvlSbhJIM1zChO
         A0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187260; x=1746792060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8k/UtXhmq/2Qq/msIxhbvQoU2lPYvZlp+9U8Xu/MAkU=;
        b=xQ+ezhrFA7m5ULpgzYA/uRmU8ArE5PwltpAAsZNdmvxVQsu/ZX42ltu0as4IaAvrgl
         nuk1+vvrPYYJrt+gTecKgh7pwE/8hJ/v9JEGZg0iEE00rBVX734eCzuweyMO+KWX+zIY
         QLfKB07VdCLPra9mWPri1XwrGRsWMVx1fgpeOlD8Dke1gP+As7ZQxvMm8MIwYHmRn6V4
         6NIHUMQDFkaSVUEaQilQuUUh+unISwntfWG/g4qPUqkM8O/2O1nrbOitZWrAUZWNw3Ea
         5S0Te1AREsCW3KTahsjc/yaXPiBeXjnexaF13lGvi7G7DYIWPcjPN7wYn+X0tIfAUIc/
         mklw==
X-Forwarded-Encrypted: i=1; AJvYcCV5+Gg7kiEuedq0XKAre7MIPmtogiOTAGKgDXM2O/OaBP4SdKJ0PqRxEcX4JoIusiqoXjWZnV6XdOoNhUE=@vger.kernel.org, AJvYcCWzbLP6kx8iIvlrzGTnwaqTPEsK7LUiSXadgVlEt/Yp87E5DUfN8IXCo9xxNMeLR4+UQcRfUblGa5k4q05wtV+Cm54=@vger.kernel.org, AJvYcCXyZOM7gTmvuG0O27+Bt58BXQIo73VYVGFZ2cswFVbESSJt+7I2SjtBYctk7w6p3c+7dWLWbJ3fwNI1Jbfdp58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR3nEViufOPA2B8Oa9VfPCWFKEoVO65etfZl/I0Q9x+LVPb7Qy
	fY0mjmAt7+FKpeXgDU4GYGRt4/I2q0NxLdl5ehzmU5DkNblN3SnUSRVM3t2D
X-Gm-Gg: ASbGncv1p/KQXjgBl+RFsHHinNmhk7+ZHXUGRr5N/OmWT2eWSljNJb6MhgMMc5xAJ0G
	hQm+vuog+p+vl9rcwUNGDaeWt6UpRNLZ1Q+/dn1DFQ9PnWsFETiBzQhixSMVIBtgApa1g5ZOVKB
	yOW4WTs3hzyeHxmcBthvq2UC5WSg0z5yO3EurGkyhBYAvT0UThLEa6vX14GqCUEySBs69EpH3wz
	G4BIwAcAr9RZI5LjEaG6Z+K8IK/aiuJJSIfqaq5u7V93RaRNpydzB3UWK4elfeHvzu5oegIVvJg
	K5S1tVB58sE3yGrnTYeNYwiFNVV6Y8bCZCJVY0l3NJygEBlWQnN4SqsNq4UuiZ2/
X-Google-Smtp-Source: AGHT+IFSSsKZfJy6EVGgXvNKEs7M+XMzv8GqL9nstbgI62P/flTogElRvmYjlQZNjteunDsuStASlw==
X-Received: by 2002:a05:600c:1e13:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-441bbf346femr21732965e9.24.1746187260309;
        Fri, 02 May 2025 05:01:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad781csm88476195e9.8.2025.05.02.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:00:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/V2N (R9A09G056) support
Date: Fri,  2 May 2025 13:00:54 +0100
Message-ID: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the watchdog IP found on the Renesas RZ/V2N
(R9A09G056) SoC. The watchdog IP is identical to that on RZ/V2H(P),
so `renesas,r9a09g057-wdt` will be used as a fallback compatible,
enabling reuse of the existing driver without changes.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 3e0a8747a357..78874b90c88c 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -76,7 +76,9 @@ properties:
           - const: renesas,rcar-gen4-wdt # R-Car Gen4
 
       - items:
-          - const: renesas,r9a09g047-wdt # RZ/G3E
+          - enum:
+              - renesas,r9a09g047-wdt # RZ/G3E
+              - renesas,r9a09g056-wdt # RZ/V2N
           - const: renesas,r9a09g057-wdt # RZ/V2H(P)
 
       - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
-- 
2.49.0


