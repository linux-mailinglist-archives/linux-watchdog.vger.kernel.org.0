Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC8D3D82F3
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 00:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhG0Wa6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Jul 2021 18:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbhG0Wa5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Jul 2021 18:30:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3DEC061757;
        Tue, 27 Jul 2021 15:30:56 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h11so610316ljo.12;
        Tue, 27 Jul 2021 15:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=axDXndZapfaWmTVFGKP68oKH1onMRn6uv0nvyJwNHA0=;
        b=Qc0r7OW6Y3ysSI/r5sg0ZPo9LT01BnlFBoUyee1b7Qm+hzXIeeXQyLvH+z5VUeqoTS
         5R9Fjdn4J2CAoFqLNsA4Z9S3Mh/nnD/MCYUCCpVaCk0Fp7Fiaol9KFu+TnZaSEZbyl7m
         GjGShnxqnQCgE/7leOKVKyVcptSS+7vXMU3T9RL9kBIFwZXZfLCnTIJUpzmPTemdh7+h
         jZ5e66UE/9aq7sEt804aGhZMXvPM5zro0Ao/0VbLglF80xF9veR+KUoS0ZfRj+sHMGl0
         kGnKKmXpEenRvoBoz8BmmgEWvhzkxWBu3h9rYaL0XIBt9k4e1fVQTY3Tp/Lx/vz/Wrw0
         XZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=axDXndZapfaWmTVFGKP68oKH1onMRn6uv0nvyJwNHA0=;
        b=NSrpLRqOGah9patdQkv544XCNXmJ8d4qbbYT0ImjbyqE6xhq2K277XhGplxoP0qud6
         R7r/1ZLk4Zl+lw3cdr9TXO0y2wdepsY7bpNwduMhAamuUyjB3uPUzeTrLRiCuUhFxBzI
         kEZlbLJhmcvavrFaUqTp4XTgl58vpFhiMrI/jnOCOm3flr7XXDDtyxmOQgogKR6GyvP7
         K4r+6DeWT3mbfxvYoOg4XVNIe4qHtkCywdkby5V54QzMxQ1er9y9LhShpWBhHrdbcbdO
         Rg79lxpe19k/UO8uWuPqu7dNPqaP6PJThsMGpAvEjur9q2GREZET08odxWIF2iFA9bSx
         EQJA==
X-Gm-Message-State: AOAM53057ZezTRcnqT4Sga4vbuay8ZpKyz449ofA3mfDZ1D2p+vqyTur
        iguwqRwNgvF7hYXS+Tyi8iw=
X-Google-Smtp-Source: ABdhPJxKUdmfxxPsbhHPaerBcZg3kVHnEzBlZcBijs3cvTt+Jqi6aIOm40MW8y1O7wSNdWovGFcORQ==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr16762752ljk.508.1627425054828;
        Tue, 27 Jul 2021 15:30:54 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id h15sm406200lfv.45.2021.07.27.15.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:30:54 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/3] drivers/watchdog: Constify static struct watchdog_ops
Date:   Wed, 28 Jul 2021 00:30:39 +0200
Message-Id: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Constify three instances of static struct watchdog_ops. These are only
assigned to the ops field in the watchdog_device struct, which is a
pointer to const struct watchdog_ops.

With these changes applied, all static watchdog_ops structs are const
(checked for next-20210727), 119 instances).

Rikard Falkeborn (3):
  watchdog: sl28cpld_wdt: Constify static struct watchdog_ops
  watchdog: tqmx86: Constify static struct watchdog_ops
  watchdog: mpc8xxx_wdt: Constify static struct watchdog_ops

 drivers/watchdog/mpc8xxx_wdt.c  | 2 +-
 drivers/watchdog/sl28cpld_wdt.c | 2 +-
 drivers/watchdog/tqmx86_wdt.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.32.0

