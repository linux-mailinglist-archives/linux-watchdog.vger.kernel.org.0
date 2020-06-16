Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074741FBBDF
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jun 2020 18:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbgFPQhq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Jun 2020 12:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbgFPQho (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Jun 2020 12:37:44 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E20C061573
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Jun 2020 09:37:44 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id d4so2037781otk.2
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Jun 2020 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition:user-agent;
        bh=TE/ZKWyB2620TP2EStc7D0hpU9orgSRap32pD2tzkHA=;
        b=KxXudJv/oNfqh/xAZsh+IWTtda1LPW3x4Y6CV2p6pCnOWAGf6Gui0vR0G+5T8eqjFp
         TxXhkHSmNl/MW9pamMii/v57kxZ1lUvkhEJ+m/rlgtjzbew8eTmMA+0s4wGC76YZqGyA
         ZsnefV2t7mrSBpOaSU1a4OAm45v3IsYr2ChHivKaqKV96cioQ3jPpGOZsotthZDWbIF3
         g+dqtpoQGjvobZM9D2dicx+3tohp9Bkb6FesK8rhtiZxgkHYl6UdpP3xkuzhB0joo88i
         Y6a9Y39M9G6sBSBzJ9Q2/pqb3vUz5IAcf649+HMvoRw4VI03uWOb9rUeV/M5gM5alAXi
         aQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:mime-version:content-disposition:user-agent;
        bh=TE/ZKWyB2620TP2EStc7D0hpU9orgSRap32pD2tzkHA=;
        b=LlTXubLgK6ypxfAnyMGREi1HwsIoZK70R2WzY3mdhPHpSexAFDsB2IQw4pi6Una6yS
         tHW0lIDPmYkv9BVhx7Mg6xBWO8HEaOdQCREnyKnsJWnRq5DdqhPCz8ZixchnZ0Mz6A4g
         UJWfiYZMssrIa9ozARnhuiC6om6AfluJlFXTjWVk8awRNWBt+nFbv1T+9st1ST7/qm0S
         ZVS1Yeh6sjPXMBB2D6024KaZJ+eM5crcC/fo8e33jop5l3BxPhcTxBzLtGSxaMBFDWLe
         G/YRigvgmJT23/g+1L9QJEaVHBqg6AfZECbm3b6N6Jgbuaaq6KbTiqfzKgBqxP+UvWMK
         eCQg==
X-Gm-Message-State: AOAM532VciJi68XpbiWpbTaByRZ35sgc5iZxNvXZhyce2Z5g+/4tSg8T
        83DgCTqJOzEeCZ/cJoPfgw==
X-Google-Smtp-Source: ABdhPJwTDwGop6YHLh+8FJsGMCWNnVfiMMG3DuZdcfQj4N2/e7jLsRlPwcBbucT61GfZsJSBl9M6hQ==
X-Received: by 2002:a05:6830:120f:: with SMTP id r15mr2994107otp.348.1592325463561;
        Tue, 16 Jun 2020 09:37:43 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id 94sm4137736otb.47.2020.06.16.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:37:42 -0700 (PDT)
Received: from minyard.net (unknown [192.168.27.193])
        by serve.minyard.net (Postfix) with ESMTPSA id E46E4180050;
        Tue, 16 Jun 2020 16:37:41 +0000 (UTC)
Date:   Tue, 16 Jun 2020 11:37:40 -0500
From:   Corey Minyard <minyard@acm.org>
To:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Gabriele Paoloni <gabriele.paoloni@intel.com>
Subject: Millisecond level watchdog interface
Message-ID: <20200616163740.GF3090@minyard.net>
Reply-To: minyard@acm.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

I'm representing the Elisa group, an organization working on making it
easier to use Linux in safety critical applications.

As part of this, one thing we need is a watchdog that has a much finer
granularity than one second.  In some applications, that is just too
long.

Would the watchdog maintainers be ameniable to changes to the interface
to support finer granularity?  Milliseconds should be fine, though higher
resolution would be fine, too.

If so, there are a number of ways you can implement this.  You could
make the interface modal, meaning that you "throw a switch" and the
standard interfaces become millisecond-level.  Or you could create new
ioctls with millisecond level granularity.  You would probably want some
way to fetch the granularity of the timer, too.  Maybe there's another
better way.

Thanks,

-corey
