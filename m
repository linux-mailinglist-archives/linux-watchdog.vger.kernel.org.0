Return-Path: <linux-watchdog+bounces-2676-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96154A0B572
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA1716843A
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64C723ED6F;
	Mon, 13 Jan 2025 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaSc/znW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09985233122;
	Mon, 13 Jan 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767442; cv=none; b=PekrMrysPQMjqjdepTwvJwkVeHdQMfiBsxlLRalntsP8vmrI165sYuPKeYw8z8rsozFh4gzd4EalJ4CNb5awhWb11XzSQnXlyk13sqi+XBMJOMYZwtJUSmiVJ3vcwYKResuQYfEPUbFEVtKabilwR6N7CmUOw/oSvo9mHX4600M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767442; c=relaxed/simple;
	bh=VGm5fga+qdheliLjGeEyYro60M9aWj5XFzDRrK6bJgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vp9RDY/xUikDMuSud4OgIelH1kcFhjbS9BpRV/fW+GhHk5hhcnWGXcc9qZ7xJLdkZcDokAyX7wLVrtqguO2LyhwATPFoug3Vm0OQhThHwKkbdkwLMOFR0bbPmod3QOILiox7K1VEtHGJPWgWHzEFf4D0UjkhkoqLNNl/IxAGKGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaSc/znW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f796586so42617845e9.3;
        Mon, 13 Jan 2025 03:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767439; x=1737372239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87ynWBBN6shlZiHmco9EO3S+qlCl+GXkGnpEybw0HzE=;
        b=UaSc/znW08iGe2jsAoZ9dcjIfD+3/Qd9Gfaa7ishPw4dx+p0kfuv1zTlybTzNm6faq
         1BLNJXBxGtc7mNcCNDMT9n12DbgkBYo4MmNltBDdBPyHUHhJNraXxs99a6z1JG19C97n
         i+hhWp48vqH9ZK02UO+WiAQPyOmhEnF+qrvIlFwtTgz/vQNjEci+YQrJD1UWQIRbr44Q
         +P4HMLvR5m2PovD9WLrRNzXGop5uoH1gYOLJ3Nw8SSb3ZoMErmIK+czzM0QlNn0mRXK8
         EAtBCcwUzcKJqXLN9o+QNI7f1Fom1GEJLWgMFnlISFPfc9TnsegC77vW4CvWv4UX/K69
         rgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767439; x=1737372239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87ynWBBN6shlZiHmco9EO3S+qlCl+GXkGnpEybw0HzE=;
        b=bL+ZXrtTH7UOaDx/ebCz9ZijKPXxHlqRqjgWzEKAWQH8gSXxoU1NaAAE+84UomCgPG
         +rKYZenTxhFy53cAeDQhvS2E3S1W544f7HAmMfq6Cw2H/1AUPH4FtAlzXs6MOda5iOfV
         r3Mm3dDGSff+oWp+1aVLaKvWPLwKml8TcS1AVCIdpYDAEpqVI5XPAc2d2gxwDQVB7h0v
         MVtg+QDrun1AhgwE/lpzkEdCGLpLGu2Z+xtO3budNkPSs6bMeGHwnDuaulFFIGNvlObC
         yKLD6ydhQRu5m0zxQ9MDyOYduq8kcsq4vJ0lVh14cC0eDwF/6qQ4R6M88nxi6FnberHq
         7M3g==
X-Forwarded-Encrypted: i=1; AJvYcCU04Cme5Lg1g4LBBwWCnN3Wo+r1QkNZyJ5nk1LvUjLSSz39YxnkZARzPglavUCHzCujaNiooZopDpNcD+AagcI=@vger.kernel.org, AJvYcCUBZ/ua9fE1sgVYkscrVJyxTU25Rl3YY4ox4dWX7WlYXJMEmowmneRSHK/U4mpa8+NBruTj7zBGrDKB@vger.kernel.org, AJvYcCUUkx/irHmnTzQPTfYwjkMknjgFaswfLuV68Un0R8tTwW2llDyagWFVyBRCZTQiAaPMg5M4x5gyiw8n@vger.kernel.org, AJvYcCWBZQ3FBSDlCXotft8oajwnZNn9sknLRFkVgtC0+Ck771DJSW2uS3xOoEOaPsHLmdfgva1lgLrxVH5iXBre@vger.kernel.org
X-Gm-Message-State: AOJu0YyY77XJiXsli/Ab3Loi2NJIDkg/gRoR5aGIXPeK0qxH36gywLif
	eWOemIgDNtqwrqLCEE1p2fzPDeyF+hpXZyzQba9+aaMKm21mE/IC
X-Gm-Gg: ASbGncu9N1aozWh7wc6Lxg6/ACjrpgOuXSnuXxM8vfM/TsdnuxF/cZcXzQ+gtlE76Rw
	YSR87T46HRv5waKJcgnHlzUY46loQwUiVwtqq2mU1EVeMkILgMuc23vJsDPx/sg9j6bVhOzX/hJ
	WQBKkkhNwMGVmzRF7Uquko1Wmvbm3KpWMI1/PLVsyf5me2pgaV3zKTSeLmU+D+hHG0EG9E1E8P6
	7txDXuV/xa6C2w6/P0Njpgl2GoVE2tlWh9SzWmy4nRn+aKwgUdwba50QPzb+tDJpjeoth95u63s
	fXh0+jvk7g==
X-Google-Smtp-Source: AGHT+IE/mUiSJ81CNgzk9veUFRx+nmoZdMNXo5iFJWm+dHgqOt9C4PSipf9QO3XW0VZq6fwQycFKPg==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436e25548e3mr79102305e9.0.1736767439168;
        Mon, 13 Jan 2025 03:23:59 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:58 -0800 (PST)
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
Subject: [PATCH v3 1/6] dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
Date: Mon, 13 Jan 2025 11:23:44 +0000
Message-ID: <20250113112349.801875-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The CPG block in the RZ/V2H(P) and RZ/G3E SoCs includes Error Reset
Registers (CPG_ERROR_RSTm). A system reset is triggered in response to
error interrupt factors, and the corresponding bit is set in the
CPG_ERROR_RSTm register. These registers can be utilized by various IP
blocks as needed.

For example, specific bits in these registers indicate resets caused by
events such as underflow or overflow of the watchdog timer. This
functionality allows the watchdog driver to determine whether the current
boot resulted from a `Power-on Reset` or a `Watchdog Reset`.

Add the syscon-compatible property to the RZ/V2H(P) and RZ/G3E CPG block,
allowing drivers to interact with the CPG_ERROR_RSTm registers as required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, there is no ABI breakage as, this series adds the first `syscon`
user and also note the driver doesnt fail if the `syscon` property isnt
present in the cpg node to handle backward compatibility.
---
v2->v3
- No change

v1->v2
- No change
---
 .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..f42d79e73e70 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -17,9 +17,11 @@ description:
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a09g047-cpg # RZ/G3E
-      - renesas,r9a09g057-cpg # RZ/V2H
+    items:
+      - enum:
+          - renesas,r9a09g047-cpg # RZ/G3E
+          - renesas,r9a09g057-cpg # RZ/V2H
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -73,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     clock-controller@10420000 {
-        compatible = "renesas,r9a09g057-cpg";
+        compatible = "renesas,r9a09g057-cpg", "syscon";
         reg = <0x10420000 0x10000>;
         clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
         clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


