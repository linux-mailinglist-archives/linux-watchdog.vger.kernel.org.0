Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C932025B8
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgFTRuQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:16 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:41005 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgFTRuP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:15 -0400
Received: by mail-ot1-f50.google.com with SMTP id k15so9816965otp.8
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=p7tXk/16xSvAY1JeZSZLzNT9FZfossOewJefr2dZ/i4=;
        b=TsXWy34d0bo+YQ65daZakcpZb4yk1+l0iVjqcWNdGH/h86/Na3ZewYTilgTV0wf9EK
         IKJDCwdEeoMMBkOdpmmza9yMpuEz1qNFCLj3nWt6iftUmvqoiFiOMpay7pFPOlqoYPGb
         ludcy75RvehQJ+Ea4IM1upVnG6zHriwF9s73GQO8EDEK+0en/WP1HqIFsFoClwZy4W1E
         FiTbYLpPXx9gdFF77fYVen42eb9kAdvhdGMzD9vzu6ea1YV+dhXKLz+SCg7zMCx2oTdM
         vnCoGxeYZLwUo6Z4iynz0FTLNptqLaxm3Hqmm/aKwNMnW3aaGvXoQLd/TZ/tiPDkI1Ik
         3sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=p7tXk/16xSvAY1JeZSZLzNT9FZfossOewJefr2dZ/i4=;
        b=ZPj2hf/iIuxFq/WsudrcQaGKU8PKG1CZpAe+51b8B2kwtuWGnl5bZFgB5vzwVLAXvY
         r+pSZGDyA0XTipV7QQYyVxEAN85LDgF8nxQyh8VmyVVz+yuEN1UTiW41CCu3bCqmcdRR
         JPfFP8Mw62KZpXJCk6nbyKYbbq7A2/6+dy4atjYB5/c3J01fUk7v2VrQrvyjIRJaVFqx
         Deg8uYz9Wany909MwIgh+nyPKVcTF5zjx7qd+XXA+E9eGLITolKIYzR8NMz01PA5jfAE
         48pyD0pIUNt3TVzECNO+eoiYOxiur842VKUoHCcPCk6Vs5hK14jrfoT1/SCSl3pNpYru
         UGjw==
X-Gm-Message-State: AOAM533OMemPbLyZX2Rf7RNPmmqs43EKWAy5//zAoDrsg0KEQ401Hi1b
        YJ26ViqsLyTSSdLmB48scA==
X-Google-Smtp-Source: ABdhPJyKHCzGVlB7wTpxFDlBuV7snwQJm8wq95DM0OVm4r+AGx06PVSho0KA5Xm0m+sa0wk8rpC6bQ==
X-Received: by 2002:a05:6830:18f1:: with SMTP id d17mr7692837otf.51.1592675353295;
        Sat, 20 Jun 2020 10:49:13 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id j2sm1248746ooq.30.2020.06.20.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:12 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 46DF3180050;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
Subject: [PATCH 00/10] Convert the IPMI watchdog to use the watchdog
Date:   Sat, 20 Jun 2020 12:48:57 -0500
Message-Id: <20200620174907.20229-1-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This has been discussed before, and I've been working on it.  I think
this is the minimum that can be done to keep the IPMI watchdog
functionality exactly the same and use the watchdog subsystem.

The first patch is something that I thought might be a bug, and is not
directly related to the changes.

The IPMI watchdog has the following capabilities that need extensions to
the watchdog subsystem:

* The ability to provide read data on the device when a pretimeout
  occurs.
* The ability to dynamically set the timeout and pretimeout with module
  parameters.
* The ability to start the watchdog as soon as the driver starts.

I have no idea if anyone is using the capabilities, but they are there,
unfortunately.

A patch later in the series adds the ability to modify the watchdog time
on a reboot.  This was specifically requested in the past, so I know it
was at least used in the past.  The IPMI watchdog driver can do this
itself, but it's simple to add to the watchdog framework and gets rid of
some redundant code.

This leaves the driver code in the ipmi directory.  After these changes
it could be moved, but it doesn't matter much to me.

Thanks,

-corey


