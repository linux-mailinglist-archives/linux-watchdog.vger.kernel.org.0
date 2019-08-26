Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B959CFE0
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2019 14:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfHZMyg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Aug 2019 08:54:36 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:38752 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfHZMyf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Aug 2019 08:54:35 -0400
Received: by mail-lj1-f176.google.com with SMTP id x3so14963612lji.5
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Aug 2019 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=GzxGsVyKTCgGl1uFi9cBRejov27f+/rUn7fIfXm3epg=;
        b=L8ahg7QVJxesfUIrh3+PjIlKzR7xYMxa4L/WuB605ZdYktxi9hXrAsBJ8LFThg/biy
         FLMIKLc59MrM43fIBe+kcX4/Lw2rvtpKiF8vyBHpEsuLUqW90pf0CZXsdzVelwdsmZa4
         8qivpHUFqec1rr5AldtvrCgm0+Rf/Yp8xZPx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=GzxGsVyKTCgGl1uFi9cBRejov27f+/rUn7fIfXm3epg=;
        b=sgJXduijhNJ0osWGsKZtGfd7BB0j/8ZkDp0iZkjTQQa82ngVS0ZVuFxRd6IuVGG7fR
         cUDWRDJ71rhnaupMEehAC/HGeCt02fGEHQ76YOZpyohcrWc/pdmGonDBi935uvlEtP0U
         Hb19tQ83N8uQWUACCPoxRDHafrkJ7sWTZmoJW899mN9M8KK/nKugm8MYfX5UUIxTkVXB
         kxU1tj0mLKwBdVNtmzaTyWP1wvNzKezeFqhn3pgf5ef9VjrUKBU7325casyJLVvICpZl
         eFav3ywJPR/O3E3tf3uK0xK0BKIaKaWEVJgygMYc5xo5/Iz7PtsGWWbLv4G1bFFy6T78
         g7eg==
X-Gm-Message-State: APjAAAWSiDts1Lffz/DmXt7x3zEo76kyBsvPO60WlXER1JSgr8bCxJ66
        /GPEM86pNZPJ3sbtKHjq57v+P4+gwdXk5GB6
X-Google-Smtp-Source: APXvYqxvgW7D2LB5wqzdFzVTOIue6xwT/qt8LPr6QdROn47+P7Q7RYmpGGP21kP6zJzq3vNpHZfZ8A==
X-Received: by 2002:a05:651c:282:: with SMTP id b2mr10624560ljo.208.1566824073369;
        Mon, 26 Aug 2019 05:54:33 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id l8sm1975891lja.38.2019.08.26.05.54.32
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 05:54:32 -0700 (PDT)
To:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: watchdog ioctl inconsistencies
Message-ID: <2d39e6c4-c9ef-4dce-4cce-14b77f331f81@rasmusvillemoes.dk>
Date:   Mon, 26 Aug 2019 14:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

uapi/linux/watchdog.h has these

#define WDIOC_SETOPTIONS        _IOR(WATCHDOG_IOCTL_BASE, 4, int)

This is a write from userspace perspective, so should have been _IOW.

#define WDIOC_KEEPALIVE         _IOR(WATCHDOG_IOCTL_BASE, 5, int)

This one doesn't actually take an argument, so should just have been an
_IO - or if anything, an _IOW. One could be misled to think that if the
int argument has 'V' somewhere (perhaps first or last byte, depending on
endianness) that would count as a magic close.

#define WDIOC_SETTIMEOUT        _IOWR(WATCHDOG_IOCTL_BASE, 6, int)
#define WDIOC_SETPRETIMEOUT     _IOWR(WATCHDOG_IOCTL_BASE, 8, int)

The SETTIMEOUT handling does fall through to the GETTIMEOUT case, so
that one is indeed a "write this, but tell me what value actually took
effect". The SETPRETIMEOUT case ends with a break, so that one is really
_IOW.

There's not much to do about these, I think, but perhaps one could add a
comment to the uapi header containing the magic explains-all phrase
"historical reasons".

Does any static checker actually know about these conventions and peek
inside the _IO*() macros when used as an argument to ioctl(), comparing
the type and constness of the third argument to the direction/type
implied by the macro?

Rasmus
