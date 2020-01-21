Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4727F144208
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jan 2020 17:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgAUQVx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jan 2020 11:21:53 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39296 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgAUQVx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jan 2020 11:21:53 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so3913105wrt.6
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jan 2020 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCO/do5DHVfIQPCIyHYXgkWfu/2dYtkwXa9z13AszGQ=;
        b=OJlRNvIRUumKavrqTqkq2pxczLISX8ldWDUJAeuIIQhMZeOw9Y2MClGMeefv0Hfh2r
         ikAA8L56giqzS8koR7L7zNBo0Mt2okR86Pbcs3fwoiWl4w64mtPXzXiZdHc4px8e3McZ
         kflG9BsgqWNTvG459jpg8x1p8hxU29+xUcsRpUek0rd7gk4poEATSW41BeDRimgSuzSY
         Mfl2ingoJZYD+6iybmeCt8CqgdLoPZZLobXYOJNWBvmQoJ1KoyF3c1kV/JqumRfJgbRd
         p4vA3pCaCyVkd68cNF6eSahA5W/uvAfYa7QqKbcOmFMzNnZi43Mb8WT9DkWRsyx3K6fy
         cZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCO/do5DHVfIQPCIyHYXgkWfu/2dYtkwXa9z13AszGQ=;
        b=N7I3yaPdKBsBfNx3+n8vx0JrUNBroMLas4SfG3Xb4R2WCNvC//Bb3SxJknEQfZNNr2
         VROeEobKa4vmecu22viQjTYxEnWswNkZZG7yyGfkKkdYBRVNs2PnVhXUzH+jjtwgZaZk
         WbQlDW62mRpx8IqjQvn7khUt9Siyo8wKbFto2lA8DU8v6n5lUJMUSdpplx5XPO6IIX4w
         bjPQXdqPvqxPEb1wx6Gh4TH4rkEYvcwZZBcfiKsYWqYYQfRElvitm6u+Kb/Hd2UgDOmd
         /U4UzkT/rXEQNv/V+agsRGl1caJmtfBQOMPv9pJ5qEAdAgLZTKWfZ+xq3Xq2WcNpOqwx
         5gtg==
X-Gm-Message-State: APjAAAXKu+vCiMz/ZTqqM6qBPDt+se+MOponRbd/JILLQRMAJStKw5k5
        3kxT5XWLKyVK9iO3IJXI9Pyjqy9JULM=
X-Google-Smtp-Source: APXvYqxklianQ0ofvqLxYR2a2z3GpqfiPn0ws4Ah0pBX2gRuHgq2zU8pOLSmdyO7K+dsYPFgWCimaQ==
X-Received: by 2002:adf:f789:: with SMTP id q9mr6331457wrp.103.1579623711462;
        Tue, 21 Jan 2020 08:21:51 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k8sm52454388wrl.3.2020.01.21.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 08:21:50 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [RFC 0/2] watchdog: Provide user control over WDOG_STOP_ON_REBOOT
Date:   Tue, 21 Jan 2020 16:21:43 +0000
Message-Id: <20200121162145.166334-1-dima@arista.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add WDIOS_RUN_ON_REBOOT and WDIOS_STOP_ON_REBOOT to control the
watchdog's behavior over reboot.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org

Dmitry Safonov (2):
  watchdog: Check WDOG_STOP_ON_REBOOT in reboot notifier
  watchdog/uapi: Add WDIOS_{RUN,STOP}_ON_REBOOT

 drivers/watchdog/watchdog_dev.c | 29 ++++++++++++++++++++---------
 include/linux/watchdog.h        |  6 ++++++
 include/uapi/linux/watchdog.h   |  3 ++-
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.25.0

