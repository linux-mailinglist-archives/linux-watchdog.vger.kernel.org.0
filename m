Return-Path: <linux-watchdog+bounces-2631-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC89FD718
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4198B162DC6
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E6070817;
	Fri, 27 Dec 2024 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOi/8BXk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228F01F5F6;
	Fri, 27 Dec 2024 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326154; cv=none; b=s5hJE8CmLd4UXbX2gGIQeoGR15kUooBOYMvfKiUr7Or/23CclWkTDFYIAg9rcfGTHFIWhqR+TxWagWxofDG5RMCbc0TLFqR3lGQUrxPbxdbop3fqwEkLx/9ih08scUz6mlNNEoz3LpjcrrDfyTcnkF+U36mVxi0PPsOnVu8KMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326154; c=relaxed/simple;
	bh=K8kOSnMOgA9niQ44aFTtBbQpvukLke0W2wNpPMgV81Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3JI1Absp/MzQ9ieJwdVh6wC20iNONzsScV7VNpUaycfNxOtYdS0VjW+0o1r6SHptKBnlIiC/g8SXeSOnzHRgTGtkDcxb2m1uBOUTZSJ3p/VJAaRHZNsYQyecgoLZUUTlb02FIZq7GN/qmG/pQPA5aWTGXT2gInc/GoG9zr9o/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOi/8BXk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21631789fcdso71699195ad.1;
        Fri, 27 Dec 2024 11:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326152; x=1735930952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8MW2a5f3Ugx1LYiTuaYc/aQo7oiFOM/y2XZRDz8MhY=;
        b=lOi/8BXkhG3Pff1OsxdxiZ13s07BctyhDNY8jNlaSi1ptsuZEzNncyHuph39slr1VZ
         SRFdB3WfWyuXtYCUfRkaJ854lpYx7/EBEm7h294/bMv4sZCkU0LX+ycGl4ARqhFLIS8s
         5m+EQmsWtJiS5uiD3xcsvo6cvzelL4JpndRug91EEuXeHekPdezqnXZDmDyV5cbjiWH2
         uJtfiTlgEL8TLJXpCzcr7Sno0/LqhBQVXZoyDuweANpj+S0YclkO7WDCfdSYTXu8DjSQ
         34usoF8qSrE5xe2SDPJw9zGbDQAXOejrFA4XlmAkd622O2p5cqrHAz3aZ4E5RBfKsEgV
         KwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326152; x=1735930952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8MW2a5f3Ugx1LYiTuaYc/aQo7oiFOM/y2XZRDz8MhY=;
        b=aF9pOav2T8p5H0Lz1G1Q4+24HzrtDv6Jpc2/0JYoJLp2zJRlPgCvAl5Sz7yws6D9yI
         u/dASMMTSTBlLc8JlLTfOSexIV2SqR3Fbsn6djS1zKsNeMEdwAlnsCdZv+ZM2IscKd4v
         Ed3GZ5YrYu54hf0AwgPny5SsYR4zlDXcFVzpT0jpYKf+WWZr8mdTRrUzMTd2q1WCb+6E
         kgs+TAgL2PGuSI5UMx34s7s/2ae1Y+3szyju+bbid5tmircFQ1TFFnpFYouj0KxCQD8k
         XUiga1PfRUMx1JYT1yWrj4Kb0oKEJKTmiuL9i6r9i3zcQE/+qU3lIkvwAcPExjvj8I+K
         UgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoPZ4+gSUs1P+yygjLLd3ULqIZAGWotvxTIMHVtFlql8mds5x614LdD+/3Ngjpse6UN6gnL4hVQJLJ@vger.kernel.org, AJvYcCUyeWjFQ2g5w52Z1fR+bEq2XXFApkT7CtahSEqzvdvFrsXwZh6SmLaUnuOW6FVpz5OtsPGPFKBd0ZKpQkUE@vger.kernel.org, AJvYcCW62lQMVsyyfwuWjiyILBGe5nc50mHS58CKa5jim5d4Fe21ioSr6w9njou1hKP6n5+DAdjbHfuq7ZCatMhzZOc=@vger.kernel.org, AJvYcCXzr6qG9cZmb4Pw6uhpEqMvvm9D2TGGlF3J8L0ne+q/7AoQZASjrKu2qqRYa1wcEcjfDKwV+GUPEh/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7M6rxs/NudMcsIGLGkJoGPvFxScjdZp9K0s3+BIR7b0tUktvh
	bhzyqCJechtrbGlM/d6H18sWdghcjnyWnb+J6K6qTvdiJUgDKE7H
X-Gm-Gg: ASbGncuFqC7pxK0bcL0u5bpkkNGBOtoEK/e9l6NYGYJN2VqiCw/4DxvkeB8MVJw7/hi
	yLdvTE2fQqgDFj7h6JMe7Wx6xG/jn138JyGqHHuY9W+ASNnIzlD3WNjn+Bg2IC9R8Pv7QBwqt+y
	PJdlUDeDhV+ROUzwcxiputplT9AX1z/ZOUdLBHHP/CiLVzKi3aby2BQMiSw1Q+OCe5jQ18oVxrR
	hWYAcs0hvpaK36hR9pLDyRXY6IZXZhv+tnVPlior0NWWebBEB2mwmYKSo15L5US6tYdBRpRCAor
	72MjHcs=
X-Google-Smtp-Source: AGHT+IF7EQOoiUeQc7dYzNRAwEmvc+DcEm/B1ZxpmYnfKB+cT+C5J0mcwvBpufbe4VijcG1zBpSzqw==
X-Received: by 2002:a05:6a00:35ca:b0:72a:78a3:7f57 with SMTP id d2e1a72fcca58-72abdb94495mr40622233b3a.9.1735326152171;
        Fri, 27 Dec 2024 11:02:32 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:02:31 -0800 (PST)
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
Subject: [PATCH v2 0/6] Add support to retrieve the bootstatus from watchdog for RZ/V2H(P) SoC
Date: Fri, 27 Dec 2024 19:02:04 +0000
Message-ID: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds SYSCON support to retrieve boot status information
for RZ/V2H(P) SoC.
Summary of Changes,

    Clock:
        Add syscon compatible support to the CPG block in bindings and
        device trees.

    Watchdog:
        Document the renesas,r9a09g057-syscon-wdt-errorrst property.
        Update the watchdog driver to fetch and report boot status via
        Error Reset Registers (CPG_ERROR_RSTm).

    Device Tree:
        Add the syscon property to CPG and WDT nodes in R9A09G057 and
        R9A09G047 SoC DTSI.

These changes enable the watchdog driver to identify boot sources like
Power-on Reset and Watchdog Reset, improving system diagnostics.

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
  arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
  arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
  dt-bindings: watchdog: renesas: Document
    `renesas,syscon-cpg-error-rst` property
  watchdog: rzv2h_wdt: Add support to retrieve the bootstatus
    information
  arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst`
    property to WDT node

 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 10 +++---
 .../bindings/watchdog/renesas,wdt.yaml        | 17 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  6 +++-
 drivers/watchdog/rzv2h_wdt.c                  | 35 +++++++++++++++++++
 5 files changed, 64 insertions(+), 6 deletions(-)

-- 
2.43.0


