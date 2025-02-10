Return-Path: <linux-watchdog+bounces-2892-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F7A2F7BE
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFA53A2692
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDFE25E44F;
	Mon, 10 Feb 2025 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPm95gnQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B8288DB;
	Mon, 10 Feb 2025 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213370; cv=none; b=j/YCEf8IDKQ7tSLnFf7YRL/3pN0G4/T352DtGgOSKFLZiY8NmNIn7JkdQlK4fr/cFtKPSGzbH/g11SVlNYBqrwUgMVGb3D1Dsm4PhwOrer8KFthmawoZXIFC/hJgVPH4+9GyFpf1DW4JsQjIUJG+gw8bAT17sEf25rxbSaOuz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213370; c=relaxed/simple;
	bh=s/03vz3+zcS0GzCnONNZFFovZBJSY2YPl3k0UdN49gU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdvo/07akOEKFYbL1d6Wjp19jXdF+7nds1FeGoFKPZqOmN7utuN4uDqeaeeFtXrhfJfLH2weDzbBmnMB5pUKmx4q8owLWe+GKgmnzOZBh0SFGCIzwT0TGnC5IcNElyk9L1uY0Oo+qlqGj5LliqvXWS/w2A5mMusDRb0emPY0gOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPm95gnQ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so2768816f8f.3;
        Mon, 10 Feb 2025 10:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213366; x=1739818166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+AGEFkz36wQgS5zJ0YJZL/2/iDepMDeR3aqGvq13mbk=;
        b=PPm95gnQWPDU3OUGMbEeRqnhk3DJvjgbP8eem/0Wn+tshUuO/dhWoRfGLTAeNb78BX
         J73tyBUNDzWHJUHokMbAknUBiyMIk2CqzEAznRSYe9RqZyLSEibI9DK3Xf2BEn8RmGfy
         8AZO+pf0O5fLVv53cVecmn/XFD3d12HepDnDccku6kS2RXM4QnSeKwcgLlad4WlPqlVt
         Rvv3aFIYw3obMhBBi7CPOxCsBLcmsiOk2DmCYbw7DGyTiQvqrdbIoxXk+zxXUsyKmyJd
         j8RUmB5/Bxl0qYWXrmSAnCJn7dBk6KtwD3H2a2FqhKt8hZQHMJKJBzk4iBwFuPH+9I/S
         rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213366; x=1739818166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AGEFkz36wQgS5zJ0YJZL/2/iDepMDeR3aqGvq13mbk=;
        b=CahPWamWgdBU0TKPEWCBlRajP283wVU/Du/1ShgyeeutnUGb/wRdJHgHBMhruIdKk9
         iyUM9NalNqFaul1bKm9Lw8QcfRmUVtazOLI2rFRldrqgn7KbkJ3VQAjwsElOl67DOTa8
         nDXSNrpaOMRLO+G8G9Cd9TXTleIbDRmHBLfwOoCtfPYdLVs4hUAhSuiX5tgmTNT7pXiQ
         Cn0bEKoTur4iA6DgPl5D/1fY/bdX08AO5/O196/RUqg68RQxmw4/asuMby2KgNKgDQ9O
         EH+TPkyoNHkoNPzmC0CAziirQaN0pjnN0jbX5TUvHXpePuOrYIjDTuY017yUkhzhTqwW
         lx/w==
X-Forwarded-Encrypted: i=1; AJvYcCUp/P80PWYiPNib1dzmeRwXSy0R3Os2XDqB5FXlI554dlKxLzTYpih3Np5xHFoOLFIBq2No2d/taakS@vger.kernel.org, AJvYcCV8qZG2rLQ+yQFJKOlNZ87/m+s1HUPGZ2LHOPB4WSZaHdiYws+OkqmkxuxE+lZ3LXfzBqPEn6LjNqpV8e0vrc4=@vger.kernel.org, AJvYcCVCzLiQByXsMZ37jStwbyR18M3yS0lgniAhovDm94JEcV2eMX9wC9I6flSwopWSdsffigwODk3Zph71@vger.kernel.org, AJvYcCWeiEWLGw1sFntfBNOY2RZVrjXgpmrq2PfpuxLSgiQ8LvUWY+K3zddhYv1udt8kfqpUcfB9fZTrZe4kHrBZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hKCA4naOlZOIp3vi83rBvpjn9UJPzcrUHQw6qAfu+G73D67L
	2jygJ2nT/njRFIir62G7i+Z+KE9rxjkcAlbvHjPYcadKe+meseos/YmT8opz
X-Gm-Gg: ASbGncsS8rezG4Ovepy9d//K0PWH5nFcbewhwhXOjJUhA4n7y77FbRSZ5XLfPjJs0Uo
	mbCibL3gD5es1tKqmPQlJkdLT/EPNGC1LWGcrD86i6fX925gZD+5LzDBvAiMp5vQ//P8RBu0His
	I3nzhZaa3emnb2NhM+7S5RbgfTxaR1SRNZGkhkNSqxNjXf3nIPZbKjOtpp1E4za+c1zxqwhwSzr
	yh8EVXXuKu+xDc8da3JIzwz/M7J6ZqK2bLkf3q+T3bjmZWCZRC0wKa/VLDqRL96v14jr5VLOTMH
	pZDFjLF3Qu1HlqN6bSzMssmhzUYTatCRxkxB/k7w1Tw1
X-Google-Smtp-Source: AGHT+IHWE+qEKJlce2UoT4pFR81zlYOstYhwToVKp7zANrcb4fO1+h9jdyIykT0jVgd15OhkBML3mQ==
X-Received: by 2002:a5d:47ae:0:b0:38d:e384:5559 with SMTP id ffacd0b85a97d-38de3845713mr1834322f8f.23.1739213366284;
        Mon, 10 Feb 2025 10:49:26 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:25 -0800 (PST)
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
Subject: [PATCH v4 0/9] Add support to configure CPG block for watchdog on RZ/V2H(P) and RZ/G3E SoCs
Date: Mon, 10 Feb 2025 18:49:01 +0000
Message-ID: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds SYSCON support to configure and retrieve boot
status information from the CPG block for the RZ/V2H(P) and RZ/G3E SoCs.
Summary of Changes,

    Clock:
        Add syscon compatible support to the CPG block in bindings and
        device trees.

    Watchdog:
        Document the renesas,r9a09g057-syscon-wdt-errorrst property.
        Update the watchdog driver to fetch and report boot status via
        Error Reset Registers (CPG_ERROR_RSTm) and configure the
        CPG_ERRORRST_SEL2 register.

    Device Tree:
        -Add the syscon property to CPG nodes in R9A09G057 and R9A09G047
         SoC DTSI.
        -Add the renesas,syscon-cpg-error-rst property to WDT nodes in
         R9A09G057 and R9A09G047 SoC DTSI.

v3->v4
- Added support to configure CPG_ERRORRST_SEL2 register
- Updated commit messages

v2->v3
- Updated comment section to mention there aren't any ABI breakages with
  this patch series.

Cheers,
Prabhakar

Lad Prabhakar (9):
  dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG
  clk: renesas: Kconfig: Select MFD_SYSCON for RZ/V2H(P) family driver
  arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
  arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
  dt-bindings: watchdog: renesas: Document
    `renesas,syscon-cpg-error-rst` property
  watchdog: rzv2h_wdt: Add support to retrieve the bootstatus
    information
  watchdog: rzv2h_wdt: Configure CPG_ERRORRST_SEL2 register
  arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst`
    property to WDT node
  arm64: dts: renesas: r9a09g047: Add `renesas,syscon-cpg-error-rst`
    property to WDT node

 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 10 ++--
 .../bindings/watchdog/renesas,wdt.yaml        | 17 ++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  5 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  6 ++-
 drivers/clk/renesas/Kconfig                   |  1 +
 drivers/watchdog/rzv2h_wdt.c                  | 54 +++++++++++++++++++
 6 files changed, 87 insertions(+), 6 deletions(-)

-- 
2.43.0


