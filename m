Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254EF29E2D8
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 03:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgJ2CkN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Oct 2020 22:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgJ2Cjl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Oct 2020 22:39:41 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80921C0613CF;
        Wed, 28 Oct 2020 19:39:41 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t22so586646plr.9;
        Wed, 28 Oct 2020 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dr2BluTtdmHH+Q1lAY7st7GEzyKQ390zItTf4RvlCZY=;
        b=S0lBInDkLvV+Ukf9zXVmro8DC9tWjX7aUr2J72GYIZ8rjGbYpLA6Jvj8xo1yi/wOBX
         T6nqZVSHlgO8vh6MzehMse9tgIH4mCaq0TVem/CbowDXZjvjtI5OMmoW+wHe9RQDBsl1
         mmt/3eiiF3K7BhOk0OAZZmWFrgu5rKFi+GKyZnD1g2yOQvtUB38QkFIqSDsy6CFh/Gdz
         SZCC0KWGmom+eFjo+U/vWx1DlyGfE1MxC/Gm6HaFK1ExFrE9gQVcAHA+Zf3yJmz30aS5
         JUK88QZfk5yv9NGXYFbT+9Yfvz6QHZh49eXDAyjT9Ay0PT1zrAhSEobkPkVuq+d09G/s
         ajTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dr2BluTtdmHH+Q1lAY7st7GEzyKQ390zItTf4RvlCZY=;
        b=n/OsTsNd9kDyVycFxnH0JW2+EwHWPQ5z73f/m+FxVNSx8czDL2/bigGLuHTCzyJIiy
         qBS8zjXA4D9WWC6v9WykKupHYCWzhjvdczePEapFDs3jP8cPKLyU8wrFTJPUMXcM10fz
         qtIJGzjv0WsYYmMVnwsaXIdTih0sooZ4BI3SqREwvIzgcByehZd17GYSfwm814O2Y3Ba
         MjoghPEsakv+g/TgJ7t70DqyA/K5ZsMTPkzyevotZXnV1P2r7ITCYF+jGUDFhhH4qQ3z
         WV5PxnfV5z5u1hgWk0dAI0fQ/wM9b8nhG85/d8N5ydPsJr+rhgColvPVydrybzsZpVSt
         Meqg==
X-Gm-Message-State: AOAM530jyQmfAtnJUiCo6ypVn/uHqDTUF5jeyd9uNAGyXMxvOxfJtTK3
        n4u/Zqz8OlHsWD5o15mRghc/uBdxQFw8DQ==
X-Google-Smtp-Source: ABdhPJwQjAyXPKt8m2X7EdmDP3/OKUlUFyLKL6avPIrYuhN05l1uNlJuY61Lk4Y1KGYMOsU9J36xqg==
X-Received: by 2002:a17:902:7606:b029:d3:d2dd:2b3b with SMTP id k6-20020a1709027606b02900d3d2dd2b3bmr1820994pll.67.1603939181101;
        Wed, 28 Oct 2020 19:39:41 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id kr14sm566260pjb.26.2020.10.28.19.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 19:39:40 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
Subject: [PATCH v2 0/3] A few fixes to sprd watchdog driver
Date:   Thu, 29 Oct 2020 10:39:30 +0800
Message-Id: <20201029023933.24548-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

A few issues about sprd watchdog driver were found recently, this
patchset would fix them.

Changes since v1:
* Added Reviewed-by from Guenter Roeck;
* Abandon original patch 2, add a new patch to use usleep_range() instead of busy loop;
* Revised the max times of loop, also revised the comments for checking busy bit;
* Revised commit message for the whole patchset;

Chunyan Zhang (1):
  watchdog: sprd: change to use usleep_range() instead of busy loop

Lingling Xu (2):
  watchdog: sprd: remove watchdog disable from resume fail path
  watchdog: sprd: check busy bit before new loading rather than after
    that

 drivers/watchdog/sprd_wdt.c | 42 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

-- 
2.20.1

