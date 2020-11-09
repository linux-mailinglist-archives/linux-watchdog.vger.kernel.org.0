Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DB22AAFA9
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Nov 2020 04:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgKIDBC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 22:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDBC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 22:01:02 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CE3C0613CF;
        Sun,  8 Nov 2020 19:01:02 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id z3so6682110pfb.10;
        Sun, 08 Nov 2020 19:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VFEdu6YiGd/yZh6LnxR5iF3YbeNFr3JoThoFpuEprg0=;
        b=clwpbAr0MeTRiKJKb0leqY0k2zGk//Tc+eN/2FQGOkiKoY5OplL5a6uN49I5x9p+vg
         bbEHnOi+JxOWIV+alzRX9cD3UJ2k86xe+DDZzNspmuSbKMhor3z1j4ReJJBw2AMVozX/
         cRSNLITeZg/talj/Rylyq1xb39SmeRX+sE2E7hDEQ2c2yLHid50kdjgWTVm573SLLCji
         wJx94tPImQn6luwtELegFWeJRGkaQFEmxjhQECDMtEYVnF4gWAbdF5eD2lojBjRZL0qL
         M6Lm/BDOaycDTECtM8XBNDF7ihJvIMbAHnccDOGcoKLLvzpdqax1YlZwHot/jbmy17hj
         JzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VFEdu6YiGd/yZh6LnxR5iF3YbeNFr3JoThoFpuEprg0=;
        b=ngZSukLZA89CSwtOc7vMeVeUkl7IkzgBlt3NVrVJhErN3g53uoEtjbVUatis4Gcv0n
         sNUuEPHXffWNU8YqF7jUDLxhV6+zHjHzyqfZp2A8OEDhCMa7Dbo43Kd8npC0Eozg6Ka9
         R+lity9Hrz+L/obXiSouIdtievudblwdsDS/oBb0cMeS7Evm+6AwMtOjkchb2rvPvhVz
         u8bFOVqFEQjY5kW7GZx+ZnHlB06m8ijdP+t+Q81nyi2w+3215CAlKcALtT+qLPbFZmnX
         9HjtUVUwRMK+/TrsW/wy0OqHSS7gwWvytSozJYBlInT3Qvpm4t2N23U7vqkEbs/7OfNF
         hsOw==
X-Gm-Message-State: AOAM531ltnamXM3XC6ZiKMymFOXKPCun5/JrgXn6ETGN6H864fjqTPdG
        4kxWh5rzW2GbHZ1gD148WRtYCxKxXLk=
X-Google-Smtp-Source: ABdhPJxXTkmP62RYIo6zSlyU2DCItMTydJvcYdU0U5a7Nd14T65qodDzYwv5QB+nkLo6Svnw65R5xQ==
X-Received: by 2002:a17:90a:ead3:: with SMTP id ev19mr11645816pjb.208.1604890862022;
        Sun, 08 Nov 2020 19:01:02 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u197sm4344606pfc.127.2020.11.08.19.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 19:01:01 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
Subject: [PATCH v3 0/3] A few fixes to sprd watchdog driver
Date:   Mon,  9 Nov 2020 11:00:52 +0800
Message-Id: <20201109030055.27378-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

A few issues about sprd watchdog driver were found recently, this
patchset would fix them.

Changes since v2:
* Added Guenter Roeck's Reviewed-by on patch 2,3;

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

 drivers/watchdog/sprd_wdt.c | 43 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

-- 
2.20.1

