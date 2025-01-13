Return-Path: <linux-watchdog+bounces-2679-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF52A0B587
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8366C188702D
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E0524B25A;
	Mon, 13 Jan 2025 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoWNz5m/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B32451E0;
	Mon, 13 Jan 2025 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767446; cv=none; b=tPScfd/Ry5kovE+RJsig5lOHSw9aII4/+YmZSFiFm8wYZucWlYba9OxufMzdAV7Q0sKmdkwbfJ8o4PXWzacwOLfWivBNS1t+sDwmUucmh8Z78uhfLLrw5gKM2uqeIT+7QTsKAEUqbqSYyp/+fNWnqnRht4Oqela14GmIbDTMVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767446; c=relaxed/simple;
	bh=QTuKO90mupaHXF5W7/z7M+qfF3kLJdby1LDYleB03ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hs+3jm7hIanrxVGLWmwAsW6is2h7MzdWH3YyXudJ20chci1JzDKNseztce1UBLeVgXZfAFmrKbs1tCYW48JvmDqsXiv7F+cJ5gLhIF8H3tzFQU03xe9vhZMeCYR8NxUaWoU2yOdAwKjrOp8fmqbxC7GH5rwMYBTowHo6OKtvBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoWNz5m/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso29595385e9.0;
        Mon, 13 Jan 2025 03:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767442; x=1737372242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYB5ATDcNZCi7okgnkXJSGRszkR/ZkKlivt4ISR5G10=;
        b=WoWNz5m/Xq0GP3q70VBUWjCq8MjAyMPs1DJ1Dkrn/ZTWHAXdaFoZml0nhSpSB2XUAP
         Ao4wWGBDmJ0D2Ps2ZL1Fd7/E+X3QptXKnqfUaSEqPGX+ojZlbsNvqufzG7n83Wnd7yIU
         kEtrkQbCHQHVDmoymX+dJ/ksrusKRgxQ3yavgou6jp7rMmDjOBcWTLmpwj7TGTgFr1rJ
         Lzdgtsy/Qz+UbHGUw+AOE8VtYmWXlIi1MOn0c6VvKXYCqK6/ICJaa86oTsI/Zi0YgYaM
         sc199d9gKXlP5zYd5sdj+HVoWO2Ls0m74x7/tJs+BKbRvXWJHbFy6PiYHX/ZkDNyAOC7
         OksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767442; x=1737372242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYB5ATDcNZCi7okgnkXJSGRszkR/ZkKlivt4ISR5G10=;
        b=gsQl54FB+0NZAcQXc28eZf71Vgii0x5UFkrlcu0uwGSt98DDwuJMviT9Oq8eHdIjQi
         qq5MlYLwn5JrK78ICEkcb4f7rugrc8S98xGXBSsI4AMPVRXB9ZNMehQjUxF6MssSY7nO
         5P/b5kKIJ/hvFJmiKlB8Y7Snp0XXmlGKlAlUEj1LKlc44AQY3FJprqiMcT8HvrKyJWyo
         nIKDc+16/WcNd5lo+L4jSQCEIMQ37nuWch+t4MOVrlwrt9RfWZ/wqxE8P7Ho7SY9AhIV
         ZNrhbqJHKwjqSOjc66xK80554PGjqubsqHWJVY7ayTshb+91yS+C8JeoPRf87M0rnLOW
         cSHA==
X-Forwarded-Encrypted: i=1; AJvYcCVq3aqs1SrV5JE5ONphxiIiSxN+AsD2Nev33ujZVNlAln3T/kcnPTIE13SQG+wKoaQlyp4JWJim0xfQNsOkmN4=@vger.kernel.org, AJvYcCVqnKbN0GtRgilRIB7x3g4qCY/9OFy1hqTny7cp3enKTePaqj1y62ty4YJtbitui+KFhHPEs0CLhokODztx@vger.kernel.org, AJvYcCWBk2sU1bJ9kBJV1spgR+jOdq8gx/dhoXk3L0iC12xiUwSlGO6cydXUrqTWH0YfnQCQWNqy0W4zrGQc@vger.kernel.org, AJvYcCWroa7gT3XijmyOFO643gpU8HgGuT6zYcCfpQdicnHleOS1kJhL7Xw/fpavIiNNVSMOzSi1HM6oQ7iA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9a8oLKHqjjAS/FzKTrpc61t21O0Z+bVW73Xe4eVNtI/zPlwLs
	Nt7+pERpokIRqPS4YNPqHNTZGEnAzB9t7EG56ocj+oixFjTyI7uP
X-Gm-Gg: ASbGncvfzaO8lKAjPnOBC8BadwrNj5CSmXxRJi5whpXvrZXWb8yFLSgx2UW9wZufMe9
	G7wXUF/RBs6yVF7UXXOdla12D52ntnr0IQmQMeiJlmnEkr9OgJA/cTGNMZy9+W6fduDYhMFVb2p
	dnUkONjBimyx6YqUc+sq/d/o9OD4iy8LSRp7OTOuv2vQVYC2IENqyXwml1GdZSWbgXda9CxmIRG
	M66zTlfPrD531zy8/kNLqp29Y2EJ0i43B/u9RvkAGexIPeDGoXGzNc5IvNR3IiiUY5IJ1Q5odMP
	KlK1NHHGqA==
X-Google-Smtp-Source: AGHT+IEUIjXBCRF4tgM1A5pmFSslRAD6ARHpcWbuWf1dVUdHNNXtKYebEeFiCmvV8w/GlO5cEvOXqw==
X-Received: by 2002:a7b:c8d4:0:b0:434:b9c6:68f7 with SMTP id 5b1f17b1804b1-436e26ddc3cmr161038205e9.26.1736767442376;
        Mon, 13 Jan 2025 03:24:02 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:24:01 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/6] dt-bindings: watchdog: renesas: Document `renesas,syscon-cpg-error-rst` property
Date: Mon, 13 Jan 2025 11:23:47 +0000
Message-ID: <20250113112349.801875-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H(P) CPG block includes Error Reset Registers (CPG_ERROR_RSTm).
A system reset is triggered in response to error interrupt factors, and
the corresponding bit is set in the CPG_ERROR_RSTm register. These
registers can be utilized by various IP blocks as needed.

In the event of a watchdog overflow or underflow, a system reset is issued,
and the CPG_ERROR_RST2[0/1/2/3] bits are set depending on the watchdog in
use: CM33 = 0, CA55 = 1, CR8_0 = 2, CR8_1 = 3. For the watchdog driver to
determine and report the current boot status, it needs to read the
CPG_ERROR_RST2[0/1/2/3]bits and provide this information to the user upon
request.

To facilitate this operation, add `renesas,syscon-cpg-error-rst`
property to the WDT node, which maps to the `syscon` CPG node, enabling
retrieval of the necessary information.

Additionally, the property is marked as required for the RZ/V2H(P) SoC to
ensure future compatibility (e.g., where the same IP block is present on
the RZ/G3E SoC) and explicitly disallowed for other SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this change doesnt break any ABI, as the subsequent driver patch handles
the case elegantly if the `syscon` node is missing to handle backward compatibility.

v2->v3
- No change

v1->v2
- Renamed `renesas,r9a09g057-syscon-wdt-errorrst` to `renesas,syscon-cpg-error-rst`
- Updated commit message
---
 .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 29ada89fdcdc..ca62ae8b1b0c 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -112,6 +112,19 @@ properties:
 
   timeout-sec: true
 
+  renesas,syscon-cpg-error-rst:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The first cell is a phandle to the SYSCON entry required to obtain
+      the current boot status. The second cell specifies the CPG_ERROR_RSTm
+      register offset within the SYSCON, and the third cell indicates the
+      bit within the CPG_ERROR_RSTm register.
+    items:
+      - items:
+          - description: Phandle to the CPG node
+          - description: The CPG_ERROR_RSTm register offset
+          - description: The bit within CPG_ERROR_RSTm register of interest
+
 required:
   - compatible
   - reg
@@ -182,7 +195,11 @@ allOf:
       properties:
         interrupts: false
         interrupt-names: false
+      required:
+        - renesas,syscon-cpg-error-rst
     else:
+      properties:
+        renesas,syscon-cpg-error-rst: false
       required:
         - interrupts
 
-- 
2.43.0


