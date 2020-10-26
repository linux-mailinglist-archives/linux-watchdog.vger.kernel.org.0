Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BF82987B8
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 09:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771175AbgJZIE5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 04:04:57 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:43340 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1770307AbgJZIEl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 04:04:41 -0400
Received: by mail-pg1-f176.google.com with SMTP id r10so5639426pgb.10;
        Mon, 26 Oct 2020 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbJmllddufFid1d+4jhorbBfZNV6jBkcr+kdG54fzMQ=;
        b=PazXHIxxJO+HyBtmjzuxlIDo6H4r6ikL3xKPtfhtqvB0xR4kb9MMY/Kssv/VN3/M1S
         byNtS7OTmVvp7ALzZVCeO6MYUA4ndH7wAqf6kjOy5g2q7jxIVPkYya4zxtzhoiJxEjn5
         W0w/8kWfdZQGngPNK+HAGbVgvTerKj6CT7VAF7aug6tfbbN9tgGuZds9qFQ1kkLeNh+Q
         WwIiXWrkIh71xGQ/dYM2IzsU5i0s/WYotgWWo/laHaimGONF7B67yr1SLKO/4X2wJFqC
         9vjeFFlDbOZCdz1JycdtkzZoQYWS+ljQH1DW3psjX9l+rd7NqYITxbyYUWuLOwZmcmzi
         hg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbJmllddufFid1d+4jhorbBfZNV6jBkcr+kdG54fzMQ=;
        b=MX5c+LI4LtqiI7bQpl0hu8cvGzfJWR1Aja0v8ib4EN8uFNgpjNNRVC67WPYLnmo4G4
         LMrqK2iitKxOCTBBokRbiu/jg/Y2zsX5dShGqgWyLibS8WnhrHEdtRyJlNbhlI+J6dO0
         s5xLio3of+CkSXZGT5x88um4AVuDdEG86ENYuieVYijwl8AJVyBKNVpbeYOmOqn6cye9
         Z0uaUzHIoZlm0g6gTVuFWkdW/3nXfUQZp+toIMPIgLlyZUsoHzJWbH2D+I+TgTy/hx3f
         WCaQNUdoWVlyGXjMRnKhosDxl1SbNPqUjGpDvkdHGzeGGH+MeF8KHWFe9r9ayzpC9N8s
         fPmw==
X-Gm-Message-State: AOAM530T89CLVQw6cQyEgmoRZbmFH37Qh2WKIT4v8ZtMrCu+Y0lyLM1a
        p1LRWs5oB2eoFjjJRTp6tBM7cLAgsic=
X-Google-Smtp-Source: ABdhPJwsPP/iAK46gNNyB3fM8aE/Pk1ZuWHijZ4KLsk5/EwEwn9Ry8FcvE1D1BKv9UtrPSac7AwQ6Q==
X-Received: by 2002:aa7:8429:0:b029:155:d4ac:3914 with SMTP id q9-20020aa784290000b0290155d4ac3914mr15258079pfn.33.1603699480562;
        Mon, 26 Oct 2020 01:04:40 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id t28sm2603899pfe.2.2020.10.26.01.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:04:39 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 0/3] sprd watchdog a few fixes
Date:   Mon, 26 Oct 2020 16:04:25 +0800
Message-Id: <20201026080428.25432-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

A few issues about sprd watchdog driver were found recently, this
patchset would fix them.

Lingling Xu (3):
  watchdog: sprd: should not disable watchdog in resume
  watchdog: sprd: change timeout value from 1000 to 2000
  watchdog: sprd: check busy bit before kick watchdog

 drivers/watchdog/sprd_wdt.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

-- 
2.20.1

