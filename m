Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADC31C2A21
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 May 2020 07:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgECFea (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 3 May 2020 01:34:30 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:34389 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726883AbgECFe3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 3 May 2020 01:34:29 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 3 May 2020 08:34:26 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0435YQbR008633;
        Sun, 3 May 2020 08:34:26 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v3 0/4] support watchdog with longer timeout period
Date:   Sun,  3 May 2020 08:34:20 +0300
Message-Id: <20200503053424.31943-1-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

This patchset adds support of extended new watchdog type 3 of Mellanox
Ethernet and Infiniband switch systems.
This type of watchdog can have a timeout period longer than 255 or 32 sec.
as it was before.

Michael Shych (4):
  platform_data/mlxreg: support new watchdog type with longer timeout
    period
  platform/x86: mlx-platform: support new watchdog type with longer
    timeout
  watchdog: mlx-wdt: support new watchdog type with longer timeout
    period
  docs: watchdog: mlx-wdt: Add description of new watchdog type 3

 Documentation/watchdog/mlx-wdt.rst   |  10 ++++
 drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
 drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
 include/linux/platform_data/mlxreg.h |   5 +-
 4 files changed, 182 insertions(+), 12 deletions(-)

-- 
2.11.0

