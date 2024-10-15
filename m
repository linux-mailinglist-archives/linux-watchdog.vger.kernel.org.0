Return-Path: <linux-watchdog+bounces-2215-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D72C99F31F
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 18:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88527B22C15
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 16:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E051F76BE;
	Tue, 15 Oct 2024 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YdZcjEDf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C01F667C
	for <linux-watchdog@vger.kernel.org>; Tue, 15 Oct 2024 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010881; cv=none; b=gC0cwwRWVOk4WyiZaJqxGILdmsemFT3eQCLE4QV7FaGwKOE6u1skJIEGzUINMWC3zFBN09PPQPyGH+4vpnxp8vvO2KqUy4weQz5Om4u4JiVpK4NhvIbRxqzZQfJMHtfFkjrliCkPF5MBG8R1w2TNzABO3H7kCCuoIHpDlWj6uuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010881; c=relaxed/simple;
	bh=Rfdl8vCaCgCBwnWghnvEo1yd6nA2LiUGF75OpPkqLJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ei/Eujb3uzOgy/B8cn1fhTSfIjdZAYvkkmTg+3jbBWF3RrpIEsKS+JZmnAOJrmM1bPLDFJ1xo53rTR8KRWwaLx2i+UQ+bmUlbMFUfGspHzeuhS3Al3ryAE+y7Bak1VQbSpBAMqxJ94yF0RqbBf+Qn0Bs0+P6Jv+6ESs5dypKVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YdZcjEDf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43055b43604so53826155e9.3
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Oct 2024 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729010877; x=1729615677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2AR2YrUQqk7+xhhqenve/PPACMkVnDOGTvsrnF2dq74=;
        b=YdZcjEDfq/J+Z3YHHh0pQpap/YGfBY+dzQN+qIcnGF4Clrq2O3TfVr5jWZIZfm6Y4b
         xbBBXruAUYpa06Og3lqAl5asC6RDlZOZPDubNhShHo+l9etKaaNBXD2ZYZmgiXUe/WGi
         kPh102rRpFCf2DO0Znknj+EqiZjddKXQGReaDO0uRcnwEsn/bZlqKvLVRiuN6g0NwrEP
         5gYgrbkDyuP/frjjNX93UzYsIUzMi9ZlDDB0kFxnkeDtY3UjXqDcHLgvsgNoO3zSzoVj
         5NhDoarB5pyb7ntKKIrUsY+/4VSHXrClw+Y9ko+a56Y5BsN8yoduKFwJWa67GnuJt2hT
         15Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010877; x=1729615677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AR2YrUQqk7+xhhqenve/PPACMkVnDOGTvsrnF2dq74=;
        b=sShziVS26XxMbAZeMP1MMCF4ja69DeLkTDKpBtKThBCTCz3rsoX1YMYnyGErFE3OSU
         7bzKIZi5X3WcdMhUI1QPtgvgIywIR26uwsNIHq8+PFaL9gv3T0ijLcO3yWOlLCX1jIqG
         V16sMrAGFVXChylkqBovki1ee3PHxPudPZY/h592bKvVGwzfVmhtEl4hilKG6uw81JnI
         WAuLNSxF7+HVZaiKEhuwM/rmqbFHfj3N4ivLfkzg0bczgFosstMCK75ZkVHFccuqAMta
         FsKN9HUrkQUmxf3G2FU7GR1gz1Ui3Eo6Smt7ZaDFogMLbvWshLhed79sYF6nv0QX75+z
         OukA==
X-Forwarded-Encrypted: i=1; AJvYcCXB+zTdRDfZ3LFxX7HOMBAi6N9ARcwA9mqM/xBHxV7FIO4znEFps/nHKC8ylXGwqDRSOu7EgvY2N346T139nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBduWSdO/gyWyUO2C8ndmrzkcLMPBHJKW7dTYGmJxo1MeaLaV
	mXtW39fcWxDb2C0BiZ9saBkPalmAixdmQvsdQN/t158wuicUOrRsQ9Rbv0qiimI=
X-Google-Smtp-Source: AGHT+IEdGlWQWan5QcF5MUQh7T+UcHlApVXWyd8jtWLk9XCMAYKoLdf78C58GnMJlSXZGx70acXOsw==
X-Received: by 2002:a05:600c:1991:b0:431:44aa:ee2e with SMTP id 5b1f17b1804b1-4314a29549amr10259345e9.4.1729010876670;
        Tue, 15 Oct 2024 09:47:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22882045e9.26.2024.10.15.09.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:47:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/4] watchdog: rzg2l_wdt: Enable properly the watchdog clocks and power domain
Date: Tue, 15 Oct 2024 19:47:28 +0300
Message-Id: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Watchdog device available on RZ/G3S SoC is part of a software-controlled
power domain. The watchdog driver implements struct
watchdog_ops::restart() handler which is called in atomic context via
this call chain:

kernel_restart() ->
  machine_restart() ->
    do_kernel_restart() ->
      atomic_notifier_call_chain() ->
        watchdog_restart_notifier()
          rzg2l_wdt_restart()

When the rzg2l_wdt_restart() is called it may happen that the watchdog
clocks to be disabled and the associated power domain to be off.
Accessing watchdog registers in this state leads to aborts and system
blocks.

To solve this issue the watchdog power domain was marked as IRQ safe
as well as watchdog device (as proposed by Ulf Hansson). Along with
it the clk_prepare_enable() calls from the watchdog restart() handler
were removed and all is based now on pm_runtime_resume_and_get()
as explained in patch 03/03.

Series contains also power domain driver changes to be able to
register the watchdog PM domain as an IRQ safe one.

Initial RFC series for solving this issue was posted at [1].

It is safe to merge watchdog and PM domain driver changes though
different trees.

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com/

Changes in v4:
- in patch 1/1, function rzg2l_cpg_pd_setup():
-- call rzg2l_cpg_power_on() unconditionally of governor
-- drop governor's parameter and decide what governor to use based on
   always_on
- collected tags

Changes in v3:
- added patch "clk: renesas: rzg2l-cpg: Move PM domain power on in
  rzg2l_cpg_pd_setup()"
- addressed review comments
- collected tags
- per-patch changes are listed in individual patches

Changes in v2:
- adjusted patch title for patch 02/03
- adjusted description for patch 03/03 along with comment
  from code

Changes since RFC:
- dropped patches 01/03, 02/03 from RFC
- adjusted power domain driver to be able to register the
  watchdog PM domain as an IRQ safe one
- drop clock prepare approach from watchdog driver presented in RFC
  and rely only on pm_runtime_resume_and_get()
- mark the watchdog device as IRQ safe


Claudiu Beznea (4):
  clk: renesas: rzg2l-cpg: Move PM domain power on in
    rzg2l_cpg_pd_setup()
  clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
  clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as
    IRQ safe
  watchdog: rzg2l_wdt: Power on the watchdog domain in the restart
    handler

 drivers/clk/renesas/r9a08g045-cpg.c | 52 +++++++++++------------------
 drivers/clk/renesas/rzg2l-cpg.c     | 41 ++++++++++++-----------
 drivers/clk/renesas/rzg2l-cpg.h     | 10 ++----
 drivers/watchdog/rzg2l_wdt.c        | 20 +++++++++--
 4 files changed, 63 insertions(+), 60 deletions(-)

-- 
2.39.2


