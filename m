Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4595F2025A8
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgFTRfE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:04 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:41917 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbgFTRfD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:03 -0400
Received: by mail-oi1-f175.google.com with SMTP id a21so11569904oic.8
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Xg2/9KOWk9FpPH3ihipAELsDil+o5RCMHbt6rU750gc=;
        b=uCneKvUOGNGSL4DYX0J6uQOXcMzh+aXyW6bgehVET/3eomuYP1MpjNNrERn9UgVA6y
         J8YMpcXiOrFV9Xn9PYxAiKlSzlqOcStWy++sDH6xGIApNeY9ukdjE4cBWqTGv1OMo3+3
         OcHFxverFPGpukd6TZD36QtNeWtDp/8Ip2wKexNLAS14Smo9VNcy0JQTyxTOIIk6A4Vp
         DE5qDb+aGPnq17ZdbktsvkXJvs3hLkNs6jzNSNNpkHWcmrlrIMt0WgFZARtPm4Ec5cOE
         TxYexDftVKFubjY2OQtErCiYn7idTqWMb1Mrry3Y8+uYSkSBqszaWgF28b9NCVTuCPjh
         vSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Xg2/9KOWk9FpPH3ihipAELsDil+o5RCMHbt6rU750gc=;
        b=XhHncpOEx0gt6Vc01HMcXG/lMRnFJUCBEpc3Xj4Fm4e808pWuAPCLz9wYv60JTkfJ2
         /IuI8UwxQed0qIevKbbjYS64ZzzlIhGYe33Pls2mtQ/oKnBZ06k5LdPy7KQL4aAIKY7E
         Z134KSr46XXZZ/E05LZK+zrxNtc1syhGebCMh+ffn/Mc+gbxF4dZYDWk6dUFx88mBbL3
         FIDDx8VjxvHn6F8ADM4rf1RgYx8wGhSzKNLo3OQa9HRSCN+himhjTdB2WvKZLIK+5X0g
         hw8bDgb72ZGJLCy1YN+uysEyRH3WrBwV7zNnvJkJpdfTUGkjbz45wuW33Fs3AKS7IW7J
         yoeA==
X-Gm-Message-State: AOAM533+53MbzZlxhmIm3d7cgJrbkeC7XE7oZKmX0ZPUV6dZqNGyt6Bg
        Ib3ocsU3FcaGUCy1AhyosA==
X-Google-Smtp-Source: ABdhPJynu6aRzLa/LEIM5GROvB8Q8mi4OxCcKurm7X8LT8oLWsGYJrUp8Bdh/j3KU6vgHxnbDzPPZA==
X-Received: by 2002:aca:4705:: with SMTP id u5mr7620489oia.40.1592674441727;
        Sat, 20 Jun 2020 10:34:01 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id k84sm1974729oia.3.2020.06.20.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:01 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id 4380B180050;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>
Subject: [PATCH 0/6] watchdog: Add millisecond-level capabilities
Date:   Sat, 20 Jun 2020 12:33:45 -0500
Message-Id: <20200620173351.18752-1-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

As mentioned before in the list, this is work for the ELISA (Linux in
safety critical systems) group.  Some use cases require tight watchdog
times so a system can recover quickly on a failure.

This patch series adds millisecond level capabilites that devices can
use if they wish, new ioctls to use those interfaces, new device
attributes with the higher precision, documentation, and it converts the
i6300 and softdog watchdog to use milliseconds.

All existing user APIs should work as before.  The interface between the
watchdog subsystem and the driver is converted to be modal.  If a flag
is set in the options then all interactions are in milliseconds.  If the
flag is not set then they are in seconds.

It's all pretty straightforward except for the calculations in the
i6300 driver, which required some thought.

Note that checkpatch gives warnings about there being no identifiers in
the function arguments in the watchdog ops structure, but I tried to
keep the style the same.

Thanks,

-corey


