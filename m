Return-Path: <linux-watchdog+bounces-1463-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE0F9499D3
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 23:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB11B282EF3
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 21:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B24158DCC;
	Tue,  6 Aug 2024 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDKLbau2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6824315D;
	Tue,  6 Aug 2024 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722978411; cv=none; b=N4TQkJRgDPHmHku2hj3aLy3Qq+UQQ/4VCZ6vVS+PxkMUL5rQUg2Oyh2r5jVpxZtuqSWsQNbtlenUPw5WgpvLGM28o6d7su8pggLdiQOvV4hXtknZ22WtJr01RVURht855KS+sXeFil4K4bFy82essGQQEfxbDYodQPzMBhjSZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722978411; c=relaxed/simple;
	bh=tYOLfx29CK4is6FjILK9GODF0GQ7ZpD4V7eaQPC9uuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z7hC2A/XKI+8kpT27aKSCxQ0/eWAtU8V4138l2kkqNior4AONkH+27aKvbPW3kH6r9hGVsDUU5XSRiUfyWLxg+XL5LDXyKmEy6ZSNy0og2K6fv47X5m4h6G6mxxxClEzV0f8wcTyYyFkpW+Ozg+KxUsOOGjebGXCfzwLa5RNtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDKLbau2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso7550485e9.0;
        Tue, 06 Aug 2024 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722978408; x=1723583208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPPMH/+ylcKG4ryd8M9muiUzqaiOJErbAQdD/Vbjb2M=;
        b=HDKLbau2KCpf1QLbYSKCVUHj98xYXtfn8hc+0TRoe/H8qCbzE9Pr3i1PnNyfRViN5z
         bTTUVXe/RjBDNbUJ/6US/C6FTlxEV6mnEe2eSjWp6mBDGpzneFJT+oiKJo6KF+WqY6WG
         1YAu1gIdIGNAZeQyq8k4Zkc+w6suAFjten5IwkHwoCSVPzDc3YQz1oReyxRi83zJ9+1Z
         h3je8f75S0NFCRu8ZFCeeAM/qHLuWQedBK5x2uNYgzbbPzpai2r+GqREVvFVj/NkJcjC
         OzhO+hPuxwEdBBzXYgao2f3GWj4YGAcQGGO+a80CX+39EbcBineYAaGLQuWJ3QAo6C8b
         Bflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722978408; x=1723583208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPPMH/+ylcKG4ryd8M9muiUzqaiOJErbAQdD/Vbjb2M=;
        b=bYr2VTc988u8XflIJ3Kh4Dwhoxt5Y92yxr6/YEMxevAU4e7hTVAKc1Z7ONabPqtzZN
         33lFz3ROC9UuHM7k+8yrhG0KjKDF5HpJTAImk3QcFER9mYDlDMecugX1MDqSjMfS3c3V
         vE5o3ElaLgu3Y8zBM4MVKjU0kbs0a61zGOQV8qQ/cQnaJ8iR3r4z0to2C+XVX9+lKteF
         iZiAkxhn46UiMMCLSIyi3UuCPtCmGITFszHsaHQAsoNt6/VFl79TU/vgwngmQR4ED0M5
         Q9Fvg0db1qly0FT7on6rXV+lcBwafa4vCESLW37cxgeicXWin0VDUr9znteWW4d9G+kD
         3F3g==
X-Forwarded-Encrypted: i=1; AJvYcCX6fu3sqW+xamjLle2axPDOFQiSLs8ugPnwXvcQUPJQvbEo0zlVLdyEJynD+qDThYevfFJ0KAiPkChpARjZmYRekg+2iKeezM+JE7c1+MuaktN+2/CSSmdsdMPhHZUe93G6VPuk6waGN5fJ+Rfavc56KxfO3Rw2Nt15fNWpcPAQdB9o2WyWDGzfDYvWQQ+1YA==
X-Gm-Message-State: AOJu0YxkekCWGy0MmPMBlPVTwdBvcBB6eQZpfC8272v3Vpp06TpModtN
	qGUASEZZthWgyra5zBybEmTEfDSwlxj/02A2wk/2BEVEJKLDi8Vm
X-Google-Smtp-Source: AGHT+IFS0a47nUcBqWZ9vtSyVhp8Oe/RZWg90rK/M0uSVhtTsX1IdrDwvP5Gkc7P27IP0MODpm4z5A==
X-Received: by 2002:a05:600c:4690:b0:426:6ed5:d682 with SMTP id 5b1f17b1804b1-428e6b09048mr103744315e9.12.1722978407615;
        Tue, 06 Aug 2024 14:06:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42904f92a2dsm1384025e9.2.2024.08.06.14.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:06:46 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Add Watchdog Timer driver for Renesas RZ/V2H(P) SoC
Date: Tue,  6 Aug 2024 22:06:21 +0100
Message-Id: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add WDT support to Renesas RZ/V2H(P)
SoC.

v3->v4
- Simplified calculation of max_hw_heartbeat_ms
- Turn on the clocks first before reset operation in start & restart callbacks
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


