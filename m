Return-Path: <linux-watchdog+bounces-3915-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA3B1508E
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 17:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA72F545E59
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 15:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9C12980A4;
	Tue, 29 Jul 2025 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAAV1bPU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9352281749;
	Tue, 29 Jul 2025 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804764; cv=none; b=iFL5etVyf+R/AnkWbAbvaCnxHg1tMU3uwzDdYt5D1z9KO/URmo7Ms6eVbAr9TC0fhTM8jTpkBCMHuVJNd/xd1tJlxKN6CUf4kA+Z9Ghs5K5bypXPhiMhGIyflLGrJyv/TgTUYDH7Q3gbEmE8fPhNcwr8GwdKPpuBqGMrAJFG8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804764; c=relaxed/simple;
	bh=/Uwc2SY7Z/6km+Rr4Z92IuU6JQeEddjwu6WpiOlnkTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oibMCRrwM1v+AKpPQaeLjYoI7dctRJfkAJ0BU/7BTem1Rv2DcSw70bwsz6ZillhUW5C12Z7nEVU9YMzzosVMAhHXdMjklEmsx7xDv01rp1+lTDW4eiRs/iD7NuqF5wGl5Zf8uEQyyvtlfWL0A8G6GBw9ex/wmNSt5Xl9Dk0T0Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAAV1bPU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so1081981f8f.1;
        Tue, 29 Jul 2025 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804761; x=1754409561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rC4tnwCR9d+VWPUO4dA3X6AklM6jmoDUej1osnzLZo=;
        b=ZAAV1bPU19fW5wM/ch4sRBSDU7wP9/pyTYiHVoVDyGsMzv5nTePfs14FylHKdt7WwI
         uJ4l0stnOgNq2ldAQ6Dx14goV+4odknL2IsK7j+K70sMVVre2diYl13Ibr6iJgJOcnSd
         jOI1XCyOlWdc1vWys01RDCSH6zNgulD+wkem9/6LNUM1ywuWaZTO3WrYVr8H5d8tG2wY
         HQauYttLYPLQN2wRsnbF8MUV0OWHjslNI+2bqfOExllnPLWaDPilq/whm1rlfBCa/fya
         fwlz3pMKNjSSxfuKdxdk+TGihmE/crnshVLe+1HZBDtL+2iY6tRJjjnrwbqVd+QVGBU8
         rabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804761; x=1754409561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rC4tnwCR9d+VWPUO4dA3X6AklM6jmoDUej1osnzLZo=;
        b=FfEUUGbgsGqwpiRTQGtxSaDcrZlTAOrJkL49ujzRVhEHKnsYoBEWF+NJ3dmzXLMjDe
         4gLyerKu8xFCISTdnB7nShDep29D85/oizrfyLBXphMmCyh00yuHBHNeq4tqgEVj9rN2
         F8gIV+be/6zXKRMT4l//wKtYXJG0GQb0SdHwI+GFFeIPdGXjHZoJ1M65wOtWPHss9lXb
         JgtHoUx2I3Is17MeD3iWshgnfBNtOo8t9aECaCD4L5vcqVJfa1jUp+zswFtfOiK80exr
         q9xrLsL98NZyRH6+8+mdMMfQFoS8IyLue9opAdOJv0UXO5/cHuvJSwSnKX7nl1/CqgZn
         cIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWWy8YwQSMymUNaScMAWUkkPLTYiDcJl4+gtiGDMPa+yDR5CoGDRA4zJl7jnnqxnPlX4rJYPXuM8b9@vger.kernel.org, AJvYcCVRj1TMcynkgFFXiSF/HUnZqMl9JHiyN8Q2jZd/y6V24ZIOgKwSAr4Sln78uLS9n2SCFg+dr7VXHu58Z+zZ@vger.kernel.org, AJvYcCXV6111oPsM+8PPOamV1d0+r8ovLbdBZbKAry+ddjKPnukNkjGmbRb2qq/CsWT4R8N4kYch64JoLSbXY7JIWjtstnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJWZZlsWtqT0sds7gm102ciagu1IThG79AKxw2HSRbT4Eyrq4n
	Z8Mmhgl1ufwJci4SYa6ItRKL1X7EkRGaQ0jm3O4cDp4zKZ39cvyA5BqQ
X-Gm-Gg: ASbGncvfFYNkCv4w9pdcSb+Y+MuNkhDy588yQKv9KBPLryaf7Hr6k3+nr7J5U8GL8F/
	EuvPaOAmDUTGnUH3OoUq+OsnybGBet7KRh/DPSE0B58VwL3JL74cRbQFLQvI0+femP/loVwsPF7
	LQOTi/V0gU+k8JCH/y9Y8/16xBFj3NMi9Il30Hb+LeT5gJvHSyfpLLrOUlB9/AqD8wPu+mXEWFa
	pNQAi7BanCQxKCGQ0pNUQA3t/LO99WFQ0WdzvlyLp69c5dg60rvXHKl4SHs3vOzQqcJXf8Z68pB
	owinPNeOuDtRkUBK37Ajz2aO57vG3v39impXHXL1n3Yv7n3lKu4tXErvXmURZ6M8+HGZIIwEREs
	tyYv6waBFI3gUc40IhXN7ElVQxdZMkHcXz1YW+RMmGP43TaNKQaEw8EdB6RBJBpiuc79apg1PG3
	nrD1kXJyq6
X-Google-Smtp-Source: AGHT+IEH0F4+/fqmAwNb30wvg61dp3OT3ePFTfj5xk/LeZuELjFGUfKKvUDeUeKT04ltlcvkKFr7sQ==
X-Received: by 2002:a5d:5f82:0:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b795033a86mr125632f8f.46.1753804760556;
        Tue, 29 Jul 2025 08:59:20 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:19 -0700 (PDT)
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
Subject: [PATCH v2 0/9] Add watchdog driver support for RZ/T2H and RZ/N2H SoCs
Date: Tue, 29 Jul 2025 16:59:06 +0100
Message-ID: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v1->v2:
- Dropped items from clock-names and instead added maxItems: 1.
- Added reviewed-by from Rob.

Cheers,
Prabhakar

Lad Prabhakar (9):
  dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
  watchdog: rzv2h_wdt: Obtain clock-divider ranges from OF match data
  watchdog: rzv2h_wdt: Obtain CKS divider via OF data
  watchdog: rzv2h_wdt: Make "oscclk" an optional clock
  watchdog: rzv2h_wdt: Add support for configurable count clock source
  watchdog: rzv2h_wdt: Make reset controller optional
  watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
  watchdog: rzv2h: Add support for RZ/T2H
  watchdog: rzv2h_wdt: Improve error strings and add newlines

 .../bindings/watchdog/renesas,wdt.yaml        |  36 ++++-
 drivers/watchdog/rzv2h_wdt.c                  | 137 ++++++++++++++++--
 2 files changed, 154 insertions(+), 19 deletions(-)

-- 
2.50.1


