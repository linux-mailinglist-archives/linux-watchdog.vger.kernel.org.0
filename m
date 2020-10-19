Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1710292D2B
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Oct 2020 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbgJSRxv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Oct 2020 13:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53110 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728504AbgJSRxu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Oct 2020 13:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603130029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=LLjblUCn7iRKFxxThjG5nVwBVGOxZRHJPdIXJgYV+lc=;
        b=e5RBa8fk+rhNZfbuPo3kr9+xksPu0vd3ZLt739vJGQdvAW6fRHq8hT4l/ibhw9HJXEpfVU
        oXbKqmP3vtzbj6CCe9ACMx6OLDfOl23c1QJE9QB76GVCmXs/SjYyhBk2M9p8qogHCqtWu/
        dEIcOsZMomUOeRMYGdB7hvJ9/AgvEWk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-HOjLzzovNnadBbJfJAXM0w-1; Mon, 19 Oct 2020 13:53:47 -0400
X-MC-Unique: HOjLzzovNnadBbJfJAXM0w-1
Received: by mail-qt1-f200.google.com with SMTP id b41so433221qtk.21
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Oct 2020 10:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LLjblUCn7iRKFxxThjG5nVwBVGOxZRHJPdIXJgYV+lc=;
        b=kaUuwT1+e5Z3f0dEdm4jObci3DIVLRBoiAAJPp0gZRVQ8tP8WuzZxKBJaVC3YpGWRu
         ygGXVSup4BhDMbgPrThNDhoL6o4LgVB9Wuh5SL6heLZGFwwOS7jhIymYOyQ+pSXeZVac
         LffNlOjmuMe0oleSTWh1JOp56XjYnADSqfyULxJTitSwKI2KszdT6KbdYrM1lsDKyghZ
         ENywzEnoB7OZVkGYm55mZPNWUfgKGvcyFeA0w7obZX+O5nfYSZnuBSg+6ioAq9nVe/pd
         9vi29pgcEedLgWSv25GZaFb1mFrbeqYheymWhPqfTAA6kT+PatetKZweSlchVz9WqtxV
         PV4A==
X-Gm-Message-State: AOAM530plg+8YRqCKirZDPBBs2Mi4l/BZ+0yQ19XK8QBo4lXEqLcyaLA
        Y0d3vA3D8OAqLxND/H+bbF81DjNGMrOHu+J4y4SI/ZwFCg0dpwePUE49Q5DFnU+g6GBICc/Er52
        fGIffq3y/MMGY+r4Pin9QyJsPbQ4=
X-Received: by 2002:a0c:b741:: with SMTP id q1mr913665qve.37.1603130027094;
        Mon, 19 Oct 2020 10:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT6/EwoAVbW9h2rP+cuwpdug2dOx3Zy6Bv3kP/mm4k7veTPYuqu5gpuCfaMtgkdu05aMzUQA==
X-Received: by 2002:a0c:b741:: with SMTP id q1mr913643qve.37.1603130026889;
        Mon, 19 Oct 2020 10:53:46 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f185sm314128qkb.35.2020.10.19.10.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 10:53:46 -0700 (PDT)
From:   trix@redhat.com
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] watchdog: remove unneeded break
Date:   Mon, 19 Oct 2020 10:53:42 -0700
Message-Id: <20201019175342.2646-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/watchdog/geodewdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
index 83418924e30a..0b699c783d57 100644
--- a/drivers/watchdog/geodewdt.c
+++ b/drivers/watchdog/geodewdt.c
@@ -150,8 +150,6 @@ static long geodewdt_ioctl(struct file *file, unsigned int cmd,
 	case WDIOC_GETSUPPORT:
 		return copy_to_user(argp, &ident,
 				    sizeof(ident)) ? -EFAULT : 0;
-		break;
-
 	case WDIOC_GETSTATUS:
 	case WDIOC_GETBOOTSTATUS:
 		return put_user(0, p);
-- 
2.18.1

