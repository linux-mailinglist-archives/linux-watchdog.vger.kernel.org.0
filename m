Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF59735E46F
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 18:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhDMQ5j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 12:57:39 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:35600 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbhDMQ5i (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 12:57:38 -0400
Received: by mail-ed1-f53.google.com with SMTP id x4so20255001edd.2
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HV5VVy8R9r75ErFZOdHFSx8QQal1z1LDKShkqUauf04=;
        b=NX9j/ekE9mKRThKGgw/t7fgHRaouZ5uOOtJjE4OOv1Fc7023vTuPVuWmDtGs23vioq
         U1QnimrtV7tLgt0EXIrZ+aR6lheeaBzTsVNVlcCSyaaNYiksbw63ibpvBFtJrA/lt9v/
         pblSh5TQX5lbXee01wi2gdjIUB14Qjj3wgxQSWkD8tXSqtXSvLg5g9fb51pt75svNONn
         8CT6d0d2vinjAQbVUjTUU3IiankP2prP86sIy7tSw3TLEQp2KYDPMS89lOeb3+rwEfxH
         sQWDxSfnGQbC8Rcy6Q3Hcq4LdS3lbvhYVIqD0QrcD8ttWM2McVWnuDAI1imxQBa9gbN3
         kd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HV5VVy8R9r75ErFZOdHFSx8QQal1z1LDKShkqUauf04=;
        b=XAcaon3R+fsMFcxRzPI5B9CkZCZhI9mEoqy2jr+3kl4gm9/JN+33mxEws5uQkXB/YK
         Av2FEQc5v3vncJmUmtxNNF35HQscQPyOUmHKkt/pL9229/+o3RXoXr+/PGouYw5FIpOQ
         oswCJUt8GbKxB3U731gykberCmynrJ0AZuTYwC6iDGCVeevur091t8WdEif/n/2SYTXH
         M/VJ9RIO2rCk7VgboFm8xKQH/W/uWuli6CBKz2V37vkcGXlMeoLP2uHQ7KGIm2peM8vL
         EcKf+4T3DRDCfAXeCdZELtbO1JzQ6OW+Hh73+R2sJzoGqxvdl/ivwS474dLN5zhIbMj7
         ZeTQ==
X-Gm-Message-State: AOAM533XCA/U6Wu4KasEYGpgEiBJ9+6YaVrWQc0VwNznPkDxZYgFEo2L
        9u9bbCnbbHXA/UuwOY8FhoNU3/h18mB2sw==
X-Google-Smtp-Source: ABdhPJy5dBjPBPd3W8LjijJOk9DlqboD4IFle+86jDuSCZHDoras2ykDqd95pfTWLmH49FgyhQeEpA==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr35931710eds.166.1618332977949;
        Tue, 13 Apr 2021 09:56:17 -0700 (PDT)
Received: from eichest-laptop (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id u24sm9508113edt.85.2021.04.13.09.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:56:17 -0700 (PDT)
Date:   Tue, 13 Apr 2021 18:56:15 +0200
From:   Stefan Eichenberger <eichest@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [RFC] watchdog: pretimeout: add a notifier call chain governor
Message-ID: <20210413165615.GA2942421@eichest-laptop>
References: <20210413154553.1968039-1-eichest@gmail.com>
 <41ec7802-e637-1177-9d16-d8fb3ff6bc3a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41ec7802-e637-1177-9d16-d8fb3ff6bc3a@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

Thanks a lot for the fast feedback!

On Tue, Apr 13, 2021 at 09:15:35AM -0700, Guenter Roeck wrote:
> On 4/13/21 8:45 AM, Stefan Eichenberger wrote:
> > Add a governor which calls a notifier call chain. This allows the
> > registration of custom functions to the watchdog pretimeout. This is
> > useful when writing out-of-tree kernel modules and it is more similar to
> > the register_reboot_notifier or register_oom_notifier API.
> > 
> > Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> 
> It seems questionable to implement such a notification as governor.
> A governor is configurable, and letting userspace override notifications
> seems very odd and unusual. Please provide a use case.

What I would like to do is to have an out-of-tree module which will
write a pattern into a reserved memory region when a watchdog occurs.
After a reboot the module then read this reserved memory region and can
differentiate between different reset reasons. Here the example kernel
module:
https://github.com/embear-engineering/sample-kernel-modules/blob/use-watchdog-register/reset-reason/reset-reason.c

Registering to the watchdog happens on line 180.

I think I could just implement a governor in the module but it is not
really flexible because then I would have to compile the kernel with
e.g. the noop governor and then switch to my governor after the module
loaded. Then I thought why not using a notifier chain similar to reboot,
panic, or oom.

Regards,
Stefan

