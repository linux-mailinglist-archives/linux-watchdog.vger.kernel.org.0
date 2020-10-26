Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828762987ED
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 09:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771198AbgJZIJg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 04:09:36 -0400
Received: from mail-pj1-f51.google.com ([209.85.216.51]:39261 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391154AbgJZIJg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 04:09:36 -0400
Received: by mail-pj1-f51.google.com with SMTP id m3so2677713pjf.4;
        Mon, 26 Oct 2020 01:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbJmllddufFid1d+4jhorbBfZNV6jBkcr+kdG54fzMQ=;
        b=ec8ahtyUDveiGBo86H1io3eQYn8aBF5nPGztcyOz+qb84rnd1QyVFs1djMEr6sI+7U
         H7b51gzsL73PGgpnWpEI0pxSswFWU+6G8yVuwF5Zb7B2O5RRs/mlmE4MsKxM1Ra7fNTf
         Y9JIee9EnNbfHm2XQq0n7isIFLRPGJ3MEP14Mr8S2qZVDjTeFQDTNrHEudWCKKoWM+VC
         4tk6KjOi8KgIb/SpijMKmzLawfMqMLOB2uANq+qs0DKLg9yQEydjz05TnTwWqD8hDP3+
         6QdEjp/HdV72Z+I4/6rdhNmNYgNNkeJnz3GWLYrK0dJM7KQ1qdS0ilrGSx/NrZz/BJhs
         vScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbJmllddufFid1d+4jhorbBfZNV6jBkcr+kdG54fzMQ=;
        b=sCKdF1TdrjkZr32S7WktKLvhp+4Gaj/rVFPoP/LtQJiKLqj8fZoDHdiYqbBdsfPt5H
         D09SmpHB3UtmKFZtl63fZyQ2oEFAzHFup2vf3631wMwOfIqCdAwYJD0oRuJmi2kklJOF
         nUKGi+Fe+q6mhbFN2KTfDNDHwWd4rXA5VhNjTfHNZtxz0J/StyuTN0FMJhbGxhz46BW7
         rp3RuufcsKbDu3YA0YA1wAZIyt7c2Tpnq66q9z9aoaDnVqP4RQKDFFO5E2ctfgRJ2o4T
         EtAIIWq3NDFY9wlb2BatmjRxl9qHuQL5wD55lJLspmy6pqSXXb+/LUJJ7fBP9Mfb/Eq/
         4ghg==
X-Gm-Message-State: AOAM531LL4nq54LMnXpH4eYk/lY0+TiyLzdK8UGjLtjJYGMjSoy/wQJo
        p9FCgq+vZyYNm2Xl6W95PHv/f+/C35Q=
X-Google-Smtp-Source: ABdhPJxuaFq1ecFcWjBamHA62eje8ZmDOnrmguNBAQxqje95cFGybTam677kNliETMF3BAeSn/tlvg==
X-Received: by 2002:a17:90b:309:: with SMTP id ay9mr15235528pjb.39.1603699775670;
        Mon, 26 Oct 2020 01:09:35 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id j2sm542825pgi.48.2020.10.26.01.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:09:34 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 0/3] A few fixes to sprd watchdog driver
Date:   Mon, 26 Oct 2020 16:09:16 +0800
Message-Id: <20201026080919.28413-1-zhang.lyra@gmail.com>
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

