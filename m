Return-Path: <linux-watchdog+bounces-3955-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8CFB1A9D8
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C0E3BA0EE
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED3723817A;
	Mon,  4 Aug 2025 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCgQL3Ey"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E598EEB2;
	Mon,  4 Aug 2025 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337451; cv=none; b=EFCKg+yf9nYcXgC5MfsCMyYPBwn9c/JRZkriCcJ943J6lJIYq55m6mqihFIjLM7MkpUHmPLrdXwtkvl89Mgxu9V3Pl0jSunSPMK+a9IqYoIMmmBp3p+YFrqoqJpyBthSN+f3qYJJYH6FaoX5nV5TXByC9/iIhKWJOd9Av/cCRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337451; c=relaxed/simple;
	bh=Ls1I6xnwjKB9nxx4YVwaD8SDpqVui6e9YgwpysNbbIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtDPtB9T3Of/VOVGO8d0YNXpo5m4lbDqadtLGdH7oxK//uKblXsH1hXnN0Xt29lJHMaJXb5Ucb6/skJDto7kh4nwsZOyc4QQAgBT5WC9DoHsgsF1d2N/ITT0WzXmcU7/0DM9oXyiicNPtRAnU6bi6UXLFcnUM2zIUf3gFp87mrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCgQL3Ey; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b790dbb112so2632958f8f.3;
        Mon, 04 Aug 2025 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337448; x=1754942248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/MyHblJ7uyowUrCYk/Yn8tFlGh2tU0BHZTDwTmz4Yc=;
        b=NCgQL3EyYTwo+tuLqGwIBmZb02UqpF4YwZuNQLRCKsZ+Dze7j0i9EI0K0H8nGdryAI
         FPjaUCrbGXkaNagosT2tB4fpZW5gbnjgo7yUkTWkXNHMgRouV/ostsTO2r2rdSh6sGpZ
         jF8Lk5xo7Md3eXxY4uI2QsoJAsiF+CaTvUxbQwhQ6klw3jGFL82Xo/jjf6t+rcBoOQf3
         DypswV5ZPesla3O6RkBpr0RU/o6tpPPTdywzIzObZKUlmudGpc/b1KQKKeD2lTJRSEhS
         3fTd5iGm7+6C5uKz8t0xFAX1nqpB5ZBqq+kFqzirmARz3kb6c0W97Fmnl1zEPjB0x1Ae
         U6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337448; x=1754942248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/MyHblJ7uyowUrCYk/Yn8tFlGh2tU0BHZTDwTmz4Yc=;
        b=fjqANI+Prwgx8XSbLBt+dAiJty+w33M6CxTiK7xCQcvjUZTJ68Kd3+kENas5a0/zc8
         AGg4HAwwN78QO104fpuSCDipGtOxGPuuerelm0VN+pXxUYoEU/r7wxmjMDHNTdippoCa
         eQZBTHoR13QvmMHlBDDN9znVzm2PBPjmyWNYmKO029cU0WnEfD85V0ZQIVVtU0/Qa9VT
         hrI2yx0v9ccg8z0515W9AlA1Fr52zDH42x55Ubl02TJWqcna8NUYDzfkwIW2vBo78thu
         MQ5829LR6DRa1t5ha4ge6mZXF1VRToQZi5ZtO6Zn0vbFCnYuxqqSqbfdwX9zZO9zg6If
         uQWw==
X-Forwarded-Encrypted: i=1; AJvYcCVf2XarO2V1xS2ClBOuI569ZCm6qRJx+LU5LLSWX6lPrA7bSOQTFZaMxQGxmZz5NuW7+CtmsayS6g73@vger.kernel.org, AJvYcCWzf7LsTuzlzWpwF5i/DW9eVbJ0HdqgdTsTaUEbV5VspcK3SrmAHoqCCVeJKkltT9w1yAmZEM+yajOVUagqlPncnk8=@vger.kernel.org, AJvYcCXIg6VYKZkEaKt2W2eUFVp7HOlNTCiOJMDZj1MMw4jeIQbrnZtT9vOYpnBXChTS18jBSHbr2QqdtWU0t7ec@vger.kernel.org
X-Gm-Message-State: AOJu0YwEB+EI7YaR6Q/EnvutjaE2Nmae1OSYE+IF+CE9qaDNv32pN8wr
	P1eJOnR0TXGlAxiOajI+oG8+Cqk42K/0/jqSSmy1tdIGmb0DqfjN/Qnq
X-Gm-Gg: ASbGncsh5B+2uB9BrC2ErbxoZKSteeLnI1+7x3Xk/TFlo3IMiGoo8hueJKTH86qT7y7
	gCNNONFe8XxJBOK3pR17GKH085Dsf5UXqW70+lOblpvfI4ZbvZpuX7sRegRsJY23pSTTdgiS4OX
	mJ14idC1zHCp+NyI2SDn9b1DRw1Qo6lU5jGG8uVMTiUQbQcTWz9iQXDjB72f90gLMG129sxWDr4
	0Wyj3NMFFi8pYt0NXdTRriBNOIuwzu7tzwuCxios6ep7jFIOQaWcgDvLGr4fKOTH5/tZvfwl1RT
	CJ+SF2bCs26/uIb7tV/0Wl3uBmKg6qQSq23p4vQKnYGEd0zrKacKplfaAiHnOWCg1Q7ee8SZmU8
	pWHrRyWXjRGOAHTpmJXPmXznGZklTzjK1qOKctuduCaVv4fd1EUls7rizXO7okR9TgprVptQprQ
	==
X-Google-Smtp-Source: AGHT+IHKjHoSmJl6K3x29t/xHimifONWBZQqAL6qPDzkRebqVVmffzoLpnolqmH405PnzLib2DShvA==
X-Received: by 2002:a05:6000:2388:b0:3b8:d15e:ed35 with SMTP id ffacd0b85a97d-3b8d947296emr6440136f8f.23.1754337448241;
        Mon, 04 Aug 2025 12:57:28 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/6] Add watchdog driver support for RZ/T2H and RZ/N2H SoCs
Date: Mon,  4 Aug 2025 20:57:17 +0100
Message-ID: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds watchdog driver support for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. The necessary device tree
bindings and driver modifications are included.

v2->v3:
- Fixed commit header for the patches rzv2h_wdt->rzv2h
- Added reviewed-by from Wolfram
- Merged "watchdog: rzv2h_wdt: Make reset controller optional"
  patch with "watchdog: rzv2h: Make "oscclk" and reset controller optional"
- Dropped patch "watchdog: rzv2h: Set min_timeout based on
  max_hw_heartbeat_ms" instead updated the period for RZ/T2H.
- Updated rzv2h_of_data structure to include tops and timeout_cycles
  for RZ/T2H.

v1->v2:
- Dropped items from clock-names and instead added maxItems: 1.
- Added reviewed-by from Rob.

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
  watchdog: rzv2h: Obtain clock-divider and timeout values from OF match
    data
  watchdog: rzv2h: Make "oscclk" and reset controller optional
  watchdog: rzv2h: Add support for configurable count clock source
  watchdog: rzv2h: Add support for RZ/T2H
  watchdog: rzv2h: Improve error strings and add newlines

 .../bindings/watchdog/renesas,wdt.yaml        |  36 ++++-
 drivers/watchdog/rzv2h_wdt.c                  | 148 ++++++++++++++++--
 2 files changed, 164 insertions(+), 20 deletions(-)

-- 
2.50.1


