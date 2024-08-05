Return-Path: <linux-watchdog+bounces-1450-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A35519482DA
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 22:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0A2280EF4
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 20:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4367A16BE31;
	Mon,  5 Aug 2024 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEqHMmMh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECF16B388;
	Mon,  5 Aug 2024 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722888271; cv=none; b=iCykemPSu6h63fB88fOdkhMwfseDKY1shKH/sUlAP2o9RSLH2V9d8sN+UQZWNT20sOqFLDktPxB6dSObesBnyY6H6MySj0F8UiifWmPNcOnv1d38Gb+EQvuzEZqxxLjK9h5q2ewgHNyHIpcuZKilc5LDB0PPnCl9LPLJhFGIJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722888271; c=relaxed/simple;
	bh=tHDPEW2QbdWi3aVodoB8JErifd3n8JmdL6DU2DzSh0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cmJHZrhU9RqYNwnHFC8LLpsofB63BrflpuvLBQgfJ54qE+5D9Z20oIFSFWJRqEY1jEpNBF/TMLSPmqO531xAK/O2L33ctpqEsi5mp6Fzw1GHvRbVQKROX/gHvmxf6qpeUxf0LVQgPalvi66AOZ/Yb8MtZQHUpzycS2WPQNFywL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEqHMmMh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428fb103724so4840895e9.1;
        Mon, 05 Aug 2024 13:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722888267; x=1723493067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B++fOD/xrG0AezkThRWHEVWZXnz0XiVvIIcVKvaF5eM=;
        b=GEqHMmMhzYr2jG8Ck8wc4YnVAspFyXW9oPJ562NN6C8kog+U1lEUeNZA4kc0D+peBE
         9tKGekqkMICQKQDEwk3KDqp0UWQ9qnrtCNqx9eRUymkAo+NCaVdEpu4zdgxsN/ej8Xkj
         sDQd1IOtBUQLv+l76qgblsBzmRJgI7Oq0BCJilUQAZw4UpcG7ydso5CC1DvJYRpegRU5
         v4f3D28E6PBCARlv1LWpyJoAuPzgkV7c1hljk8XcbIiuZ5d5J9hz9phxaj5qrJjIavnP
         D6qJpShSFnPFJI8pcOA8eE9hphSVZ6/X/JQ31Dy1X6x55ppY6QflT1P24KgFfbYlRbrd
         Q2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722888267; x=1723493067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B++fOD/xrG0AezkThRWHEVWZXnz0XiVvIIcVKvaF5eM=;
        b=c7ufqQdNMc05XxhXgyWeFAP1OCU/9/WQpYnHcHM3E8HpPoePspzGc+UYBewBOIZeL/
         t4Qtb95UZZsjPNh4N9gu/eIe6UrqSzvei/v7DLO1gfCGp6oTpKJlqqzlmpKA0Vek95oi
         XdH4ZJtizbCC81MsLOVBxfPRNq1H64dyxJik59PrST3V5XVWltqyUmQMcIFs6lY/w88d
         34cb9CUPzo0fm6XJ6ybn0QzxN+boxhfauNcIPQU4yaOIPj4SPRK+AXsQ/GsdahFZPzGr
         oPWSrHidruSZjChWFdn5+wHclm7S2M4CmxBLf7v2cjoKG5DN0ncbnQ/cEn1+pZ7KXYh+
         UwpA==
X-Forwarded-Encrypted: i=1; AJvYcCU9z6wi/PocDQiGpJ8frKu2o1YvXOCG4WBxvf3CuBdJhi7qb96cbr3QbTP/Ho5fbdZ5Z/vND27NI27EWGiF//mG7fWcFG4mL5FcWNQLQ8Gv79IdB7E6RCI5OhwAZe1SFLCheticNhLtJabmPDTCaUUlLz0BynGAO99i74lHdIJz38Rth/TZFcZVvn5bYAeqUA==
X-Gm-Message-State: AOJu0YwxxzjTM2fKWXDAy5gER/aGKHV5ZtLRxkCWa9uGS/UzHFboG15D
	VHgIhmgWlBTkPOsV2005coiup5Q4IrvRUKqmAWEsIrliun14ZUJ/
X-Google-Smtp-Source: AGHT+IH0Vw+XNp2hee8Voi3a9dgggGn2Ry8MwhX7I+rc/EbApIc8M6fkGeDObj3t5s0MXK/SKKjMpQ==
X-Received: by 2002:a05:600c:1d20:b0:426:706c:a55a with SMTP id 5b1f17b1804b1-428e6f7d703mr89380215e9.2.1722888267372;
        Mon, 05 Aug 2024 13:04:27 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:25b8:5324:d26c:319c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bba283fsm212967405e9.46.2024.08.05.13.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 13:04:26 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add Watchdog Timer driver for Renesas RZ/V2H(P) SoC
Date: Mon,  5 Aug 2024 21:03:58 +0100
Message-Id: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v2->v3
- 

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
 drivers/watchdog/rzv2h_wdt.c                  | 259 ++++++++++++++++++
 4 files changed, 285 insertions(+), 1 deletion(-)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

-- 
2.34.1


