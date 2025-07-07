Return-Path: <linux-watchdog+bounces-3827-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B12AFBC14
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917924A1458
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1BE21507F;
	Mon,  7 Jul 2025 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhwwcmbl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271AD1EF091;
	Mon,  7 Jul 2025 20:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918480; cv=none; b=NmmXKWP4Nk0dX8o+urON6y5izgRAROQCIyKWkWopSyUImumn/T4gYswElmck6nlB8aA1qNzbrbQ2WVyJfx3WWM4uEUekFT32+At9x6I8uFNIeonQ0X3bBxJ4WldarWk4ACw9ncbiuL1LddCLTrqOlWpNCTxTLsm7fcynj6EWwMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918480; c=relaxed/simple;
	bh=nw7m6zoFmIhZe7hAFS8+ViPrXToms/pNtA6bvWfVdN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrG4A0CvMOEXk/NnayAy5oeGTQydenmAkRGF3WnMRn470x2rvde6mst/Xvgttot9Fdv8EWBVW7z/2gN/y9XFse9dzubNSiO+7zZoW8Am0uMokyLtOekl1b1FJpkZ26nI1zPokKDNtjSLqWOQg8YIsagPVMb6eYJdcCAPEswRW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhwwcmbl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso32847095e9.0;
        Mon, 07 Jul 2025 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918477; x=1752523277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNJURKK5niSy6MyMTsQlWsFXNTBiKdE+15SJ5H8B2q4=;
        b=Qhwwcmblh1meoEO3Duz6QMPRBOhMlaDZ2pf3CQ3H4gwutr3+wYqg5J5rj5pgbyWPhN
         Xh9QLHEqV7TPsb+/OhvElrNVmnooRCYcPh1hz4mZEr2i2yjSeapOOg5QQ1uQUd659X53
         GgV+UbzNaB9OjRuDke+EnizgHYKkNqzL6CKiBZJuxZd1GH2MXfLFMlCrpqBwb0tWR60H
         yxRC1IMTjW5bqjJ2BVhviGbl5X/mMNF7dYI17BN+R2CkNFx4X9Scvr7ZXwQkMSZe6u8I
         AvK+Zb6JjncWJDo+RElr38ZMb2+LUYqmk48QPXifCcJ7E040J0JKSJunJZK4Rqub47g/
         tWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918477; x=1752523277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNJURKK5niSy6MyMTsQlWsFXNTBiKdE+15SJ5H8B2q4=;
        b=xHaOn2LnqVhAQNNpQ0ySQtu0yOx0mhnzJghVW6uoy4NTu2xY5Pj7Q9qsCgnqj8EGGN
         d7GXExNQ66gXe2bU60uGbVfqdLocyYgydvpa8ErWBCh1cuu4uRVtjZXAk4eP3HyPtAxd
         69zThOA1OJRJEk7fM25+xXNriQQeP5pOphde1Qq5kPwiPbb8+McNJozqY5T/zEw9XqiU
         rg7O9EWQ6H41a9P8Jo3aUb5rJIw1s9LVSzsJKXJb1D+VL0fz4JDZmULBA0swbWKxeH8J
         iJOok6oTHMhUfam6+G+K/UmAKUQNUGgfJ5NXx5PcIwRovU2VRg+0Vv0vAYjdyWF4XwrW
         kpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6XeFLR5r3S7nBBYNx76hSx5eTbf5Vjz6NyAnbu+7PbfqyqnUn4Uv730ZgVA9Erp3hhZbJD+zCJ3CFvCI=@vger.kernel.org, AJvYcCVCqBJd9eq2Q4mn+Yoq/0T+Z1DcgUI357pApJsE2EIvEvqndJ4ZNmyyxMTz+aDHWhFcswZXPgCYNrn+ZdCvqrM=@vger.kernel.org, AJvYcCVrXTuMwbDxx6qNi2mNc/drmKRYsdN4q3O0vHU9TeB4rv6sSPKouTfh7CG2lS/VhgM5f6+iQeHqTiLb4YxniT11kdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRxniBsUvQTUwIC7kOa6QeLNWvjRkvk6OAG8LteUsfRoKrJdL
	XbDTeXxqObTEEmrohe3P7UwYdGyFMocPfvwPgKoRw1pQpk9+pQ6M4yqy
X-Gm-Gg: ASbGnctWkRzbCPqrDueoIDlyAn8gqN27D/ccyHmDcpXjLMlKQKfSMoByhhB39d3Vvbn
	jBDg+dc5IydSZTwz3QeqhP2Rw3V1MkYpwpAli+cbiyc7w8yTfdmpTCFTWzpKcCxyCFQf07WbJJM
	qYqMj50WZ4fP8PrKs+iyMgJGorzQb1TBdpjdk8XCPv149LQ4THQUoee/sSI8h2qiAYQobzSMNVi
	H5zZJIBjk61Eaab9BQt5ZENSLVuj9emakovoM7oVIBpwGWIG+ePEHflX5fXMkfKPZ3OhUKpTfq0
	50jaBm9aXScHYDtSVr5zshJo6Amkmx3D6hlhN58WkYYVl/W9y3TNPi5jPxSDqpLFPndkSOoB+mL
	jyKSkIhNMIc77fFcJTz0=
X-Google-Smtp-Source: AGHT+IE7kw9fcOu6dAAWkp44exlUHg0CGXYoF7gPm5U4E1uoGUt3VH5ULC89IZUtRiKitZEqzaIZlg==
X-Received: by 2002:a05:600c:8718:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-454cd60c241mr631935e9.6.1751918476780;
        Mon, 07 Jul 2025 13:01:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/9] Add watchdog driver support for RZ/T2H and RZ/N2H SoCs
Date: Mon,  7 Jul 2025 21:01:02 +0100
Message-ID: <20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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

 .../bindings/watchdog/renesas,wdt.yaml        |  37 ++++-
 drivers/watchdog/rzv2h_wdt.c                  | 137 ++++++++++++++++--
 2 files changed, 155 insertions(+), 19 deletions(-)

-- 
2.49.0


