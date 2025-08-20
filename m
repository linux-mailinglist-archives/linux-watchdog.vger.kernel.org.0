Return-Path: <linux-watchdog+bounces-4016-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93549B2E668
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BF604E3886
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6092D2BD582;
	Wed, 20 Aug 2025 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG+9eib5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFCD29BDB3;
	Wed, 20 Aug 2025 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721408; cv=none; b=gHYFm3skdLfBj9NgixJ2KtK1UutmBU5bLS3fMjH2xo4hbmYzEkNZcXjU5pDZ9YZVQ1poQEz0bTFU2DXV8XSRKxeN80ura7Z9mZyYsYsFCL2vWzSw/LHR2+RV7m2rqnyVKSTQap1Fcg2IeV06SarKZbOnN5nv5V9TMyQnMvN71JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721408; c=relaxed/simple;
	bh=+DalE661eJEys/qZgy31C6MQ6pcmDofcU8cj8Ao6x2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rjd2VJZ2K/z+4yq0JSjV//PkkgXmgTu5v8aY02arMOAIss5imQ+mL9rre/H/qjPuAeG71FPFzEjbcs39GfxxND0i7i0IuvCg4zAJyHJlzfMV89JCJCBxh3xVd/69wd21ZGy6YKv9tXlqW1tDKp6rgp1fzoCw0F0Cut+yHMDCrwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG+9eib5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3bb2fb3a436so150152f8f.1;
        Wed, 20 Aug 2025 13:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721405; x=1756326205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+JMnfVk0eZesLYMwjq66M1EKLjCyRbvVqwMrJWQbZmw=;
        b=OG+9eib5GRA2zw1tz4UhcrzZCBuAypCnCWsi05fy1EYeFg4r7pBHawb2X1WoY89on2
         rAEcqrNsncunNl8XjlqYtSE3VdgGgGo+1avF+ENu/xSbuKmJ96Lvp2JUC+T1fHILuqIE
         avphPgkUHaLnMbcg4Nq/Z58vqeO+BJzJzKiN1pXVGCk5iidce0yoKzNwOq0RPiBtOvK9
         Q3ve8XbJ4zw9c9/ef5/I7GBpYpIV6aq+Qwhf3DoVgSWN83mlUbX5q2fABOzY7rU7XUag
         Wg36VRZV6ZSkm0gbuppLKrAEp/e3/08Ffvduezs3AbE6LF2s+mINOUPAB1UL4HeIlKQp
         3dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721405; x=1756326205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JMnfVk0eZesLYMwjq66M1EKLjCyRbvVqwMrJWQbZmw=;
        b=rJPwsMF8Y1VeqlfKXBtniaSW07TOa6jojtsTY0HoyZYqMlvzRLlhqzs8fo9C1SaiJT
         MqoxYEWDNFlPvRM8+WT0yeEgMFwwXNeymoCsExWXZH3AwhQl0HBINVCVko6DiS//M1VO
         RTOPHKAwoilsebt5pSzQAgROwN6x5ez+GshgTgsyuaWxn4tgEb8FihiisM8nhs/mWbrY
         nrzv9RHRxKxPcFrbOCi8fhVjaJgjo4R6rBXz2+B9Tazmzqtzxuqw66yK7oQBvksErV7l
         hucWO5ic4gUuFZ1oHTjSZ0iCKEl9Y+o/K2jKhjE75xt+sRYvsCBhpdOv7t+tQAJd/Zye
         3w+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9IWmI4KqgnHp/1rf4fGcYNcc3zJI/6SsdXnTWOTaICPvOXCoRMSmvsNKGL7MC5wCZv6Yd5baEZoBWTl3R@vger.kernel.org, AJvYcCVKbv01vzs81k9Y32sBiXgdngJJlTtTxGB7hQN8q4xBT0juDalut5ugCDKarouN7k07SpdjhKHAs/N/noUOWr7aOTQ=@vger.kernel.org, AJvYcCWiDEWr3e/06DS9x7gAKV9GWJ0GxwSvs8UUTC2HrmIgCdD9M+67DhAVgl0i+gg66sU/sOSbnxe8Gaku@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpm4O/pCxbObYVWFLRYKDw5OGZoc3NyfvCDt57pVnadj2t/UB4
	Tp2p8uE17C3/zBOHmx0xUU/sbhKW0qZbNanWQJtq7fyyT48ZRBF/xNz9
X-Gm-Gg: ASbGncv56F/y1XbfX2kiF3hPEu3HRmM1ubbT6EOXNgZMBEPxbjx8yhGtDZTTp00Db6F
	tl9h5ouaClh+Yx06qOk3kskZdcCsZ3h8nBCXRS+9WI95eBW3fB2yiw1ToEOVHgNdKPiWFZkNBg3
	6s8s8LSaPKHXsr8Bqpe8cpb0uP2+K+Lr0M69pQ2LfSHpHXAUnQJr9tViiTLuUIr6Z+vKhH9LW/b
	HMBUYmFq8Dhdp9GjqW3glMxye1JghGyVewz9KT5juYGjYP8mxncA5rUn7mCcJHBy92JtgsEy1TK
	UtCOggFrGCp9R674JR0+kVGqIiiyDMWQO6naMX4NHWh9rvxJpZMD5BrBgUa86Tdszr03Yhsqbe7
	slHJz44vCJXCTmwEQOUt9cxRNRHLgsCas78G8XwnBz6dLJJY7876aaYzT
X-Google-Smtp-Source: AGHT+IG9sAh8G6qTZ/z2EMTh7C9L1gJQG3hqW2g9XE0NIZoYDG0kmblNN85yCMANJ9au2xA0ZSIhXw==
X-Received: by 2002:a05:6000:2508:b0:3b7:948a:1361 with SMTP id ffacd0b85a97d-3c494ed1930mr104599f8f.6.1755721404574;
        Wed, 20 Aug 2025 13:23:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: [PATCH v4 0/6] Add watchdog driver support for RZ/T2H and RZ/N2H SoCs
Date: Wed, 20 Aug 2025 21:23:16 +0100
Message-ID: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
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

v3->v4:
- Updated commit message for patch 1/6 to include an example node.
- Added reviewed-by from Geert for patch 1/6.

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

v1: https://lore.kernel.org/all/20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v2: https://lore.kernel.org/all/20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v3: https://lore.kernel.org/all/20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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
2.51.0


