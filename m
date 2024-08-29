Return-Path: <linux-watchdog+bounces-1632-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78343964F23
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 21:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDFF4B20F23
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 19:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BCD1BA29B;
	Thu, 29 Aug 2024 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3mEuNux"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B021BA27A;
	Thu, 29 Aug 2024 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960326; cv=none; b=jBTsOTfnVqCdck/bKP4yOJkOamD8aXz3nEo5ivAeLf4SToy2f0OVR+wRhg5ZxdSI73kFmefiU9Fs4noKpPBVIGY7nN/JHqku/MA08Zj81RgfRhzZt+ys0jZ8ALLy23Psl10t8TGsGwwhyqyuTNRF8eLoJfQRY4bm0Wty7/W44ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960326; c=relaxed/simple;
	bh=hebVdy+s+YrVltWauBOkobHWnNyoTs+qfCBTlv+hLAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SFx5yoIw5E6PC3WHvs6UtyorYLsFNn3YxH3e8aRejnWTBXtLqZZ7YjA7CUWFpoFWKj91Hl9jZlXiQAE4uDIv30XWrDHAMNxbZiMGX2TVGRyyQx14Gwbq4XKf/tfu6KwIV2uEqEdf/DMt0rjsdAOGrcCnEbbJqJNcgfwGJqvHg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3mEuNux; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428178fc07eso8728925e9.3;
        Thu, 29 Aug 2024 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960323; x=1725565123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogr8Tw/YsnQo+Rnr5GAEvkNZlIOjmvoteGA1lmUBC+k=;
        b=L3mEuNuxbKT7uwroQcLMld8WoLV1iANpSVuMh2+NhbdQwyvu50RgWg5P6gtkb3OF5b
         H7uYgtk0NKb52Qk7UsJYKW6h/dZSe2VcRH5gpjSBrjG2duqgET3ji024ujmbOJ2S1gLg
         WrLY43m7Fa5mhiIYin6IQ0XC8tMuOYv0tWbjwfrBLl+vePzrrcB0whe+8dGBgJg9FHuo
         RFNB92KBP6FFrRfYVnBc+oiv+XjFNBSrK5eFY/tWywCA21jsJvITWhwj2ScPCgnPQb5C
         OuXHs2lgfMERtNDFEigh47aMI1XTCnmCf2Gg8wqOV1Cw7whh6Rw+99vVc/a788eEb9Ic
         OWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960323; x=1725565123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogr8Tw/YsnQo+Rnr5GAEvkNZlIOjmvoteGA1lmUBC+k=;
        b=FjFjvQ2Oyb4iYbgqZGz0Up5YVCftKJ6umT1D7CnCTcYLvPm+6ObLTKqi+5RDozqS8V
         mE6tyh+Pwd4jq0BouQxBmiOM8zrUuJBrQ9VO1ewWQCrUhtNyOD95OZLnuW5lLFWkFw8k
         JfYdeiiib5g2psMh35CavOvCygHxjYOij1mG3RFxA4E7nGPS/OFChQ6ECxpCwp4k3GgX
         2GVA0XzeImZ9f7pS+CjhFKNIUVVS9f7HgTFMRF6hT076OXEtzD7w/bPK3K3A68iXbvez
         Kh2G9hUSjXi8EeAOZy59vi+dAPgUE85ACeNw2/ZR64onmSKrzrh2neFVx8+KqvUYRsaD
         Eiuw==
X-Forwarded-Encrypted: i=1; AJvYcCU8BvR4MMNTc5p4xiyF1ZjMgjy9NOCpVbFY8IUMgjJtTcLbj2lu0TDbzJVI8wR9CJn4kLCXgMZL/hdZ@vger.kernel.org, AJvYcCUcJcxi1/KGXfJkk0OmavIvp6WPc+1wAb8BrZxM0RujYK4BUd0t5DFxuWyOM7FXHT4ydXQktRwnGfj7UfZNHXORypw=@vger.kernel.org, AJvYcCUsg0R+WVQ/dN7akhw4kmFRhuP5g/bFHJZsrVBTb0Av8A7ZyBw3FDMfrLekRoO6i7wtIFvFfTRNg0risqxc@vger.kernel.org
X-Gm-Message-State: AOJu0YypKi/Z7hsQHaCerrhy+zMsXtyyBL/gn4eEwHVK5wfl2MCE+WNl
	Dc0Xek26JRAeQ+KpwdgWZvP6rR+O8AvD+M/xS54efgmXMK2wfXMm
X-Google-Smtp-Source: AGHT+IGfX9YZvxz52A4heYVnDRHmqC+CdgQwnBVJMJlm+EAhHUroXy92OfFjaNDev9wxHqTAWKpt7g==
X-Received: by 2002:a05:600c:4ece:b0:42b:a356:a75c with SMTP id 5b1f17b1804b1-42bb0309905mr32769505e9.21.1724960322538;
        Thu, 29 Aug 2024 12:38:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a26f:c074:4086:5001])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb2c91sm2140049f8f.102.2024.08.29.12.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:38:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/2] Add Watchdog Timer driver for Renesas RZ/V2H(P) SoC
Date: Thu, 29 Aug 2024 20:38:29 +0100
Message-Id: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add WDT support to Renesas RZ/V2H(P) SoC.

v4->v5
- Updated commit description for patch 1/2
- Collated RB tags from Geert and Guenter

v3->v4
- Simplified calculation of max_hw_heartbeat_ms
- Turn on the clocks first before reset operation in start & restart
  callbacks
- Added checks in restart callback before turning ON clocks/resets
- Dropped udelay after every ping operation
- Added comments

v2->v3
- Fixed dependency, ARCH_R9A09G011->ARCH_R9A09G057
- Added dependency for PM
- Added delay after de-assert operation as clks are halted temporarily
  after de-assert operation
- Clearing WDTSR register

v1->v2
- Included RB tag for binding patch
- Fixed review comments from Claudiu
- Stopped using PM runtime calls in restart handler
- Dropped rstc deassert from probe

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
  watchdog: Add Watchdog Timer driver for RZ/V2H(P)

 .../bindings/watchdog/renesas,wdt.yaml        |  17 +-
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/rzv2h_wdt.c                  | 272 ++++++++++++++++++
 4 files changed, 298 insertions(+), 1 deletion(-)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

-- 
2.34.1


