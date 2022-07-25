Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6226B5806D4
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Jul 2022 23:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237511AbiGYVdP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Jul 2022 17:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbiGYVdC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jul 2022 17:33:02 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA931255BA
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 14:30:31 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s206so11495661pgs.3
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wLeFnHeL7vjlKLn8EGTK3JTliauPikeFfDHsD2Hn0tU=;
        b=XTWzP+/My95HROYMjfb+t8+gWtkKCzB2NVlrMWvMvTAG2ddPIUNbbx/VGnQDLo5s83
         0Q3+YubYnDC9NCpHwR5CNCdOPDeweLAO/wpX/lERQS6TBstdTnPj4PVNT7C09ODKv4dc
         n7YR9CYi0ysDjG40GM5zhVmU+ZOB4CFTbWBdrf8rQyrCnGywIJjiD9IYGYz/0bac708j
         IL+CLgwYFF58uI5Tb/pRW1nl7Jjn++YmCn91SOrxweBOwc8NBAr7I3JfRr9JyjTQbRDS
         5bM8Cu/2f3aLm8O+8YhiSsF8+rMZcq0AM1LdnCSbuH4joKYQDzs0jg/LbDNMXuA9Lzwd
         xM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wLeFnHeL7vjlKLn8EGTK3JTliauPikeFfDHsD2Hn0tU=;
        b=bXMDKgnM56a5ox3+oE2Tu1UHTyqKCWfygXH4JcC9xDkGE/JW8kV1q6miaXG2RjSTee
         91s40vZpJJ0dHU830xiRoSpe+TYjlIpDSsetcnXWxFG7BqeXFj7yfV5OdoTcYYUDmYWG
         jz/rPq1z07SILt5jkPFR3SSNQ0/qR2Ykh7raTjWKmGaQhT/J+QHXM54PUFiMT2MXtnx4
         xQ1dmJGP+rLXTRbZ+d1bbUmZF5URsN3FhLP/YlHkFzhH3UUOhV7/8VpXtdyLV+vbZEt0
         kY3DWFXwpjKIEIgq/NCeLIikLyMWNl5fjPU/IIK+bE+VPp8TSN65BrlEZN6s41HY4O0A
         GUgw==
X-Gm-Message-State: AJIora+GEqH9FYCFV817PVfslbgwF96npuC4F2uLHrwG1Or40Cf+hKeD
        2rZugexeTcbal2VEVxvc7uI=
X-Google-Smtp-Source: AGRyM1tpYITPOSLmtnwiMWtXvd7QNjLwwbnlTkrM/UJTcSzE7nhET1ps5q26rjMX0UVHLKlKPFLCGA==
X-Received: by 2002:a05:6a00:15c3:b0:52b:1675:6dfc with SMTP id o3-20020a056a0015c300b0052b16756dfcmr14849019pfu.52.1658784628335;
        Mon, 25 Jul 2022 14:30:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s14-20020a17090a13ce00b001eee8998f2esm11555790pjf.17.2022.07.25.14.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 14:30:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 25 Jul 2022 14:30:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Scott Cheloha <cheloha@linux.ibm.com>
Cc:     MichaelEllerman <mpe@ellerman.id.au>,
        linux-watchdog@vger.kernel.org, tzungbi@kernel.org,
        brking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Message-ID: <20220725213026.GA1319556@roeck-us.net>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
 <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
 <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 25, 2022 at 11:11:41AM -0500, Scott Cheloha wrote:
> On Wed, Jul 13, 2022 at 01:50:14PM -0700, Guenter Roeck wrote:
> > On 7/13/22 13:23, Scott Cheloha wrote:
> > > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> > > guest control of one or more virtual watchdog timers.  The timers have
> > > millisecond granularity.  The guest is terminated when a timer
> > > expires.
> > > 
> > > This patch adds a watchdog driver for these timers, "pseries-wdt".
> > > 
> > > pseries_wdt_probe() currently assumes the existence of only one
> > > platform device and always assigns it watchdogNumber 1.  If we ever
> > > expose more than one timer to userspace we will need to devise a way
> > > to assign a distinct watchdogNumber to each platform device at device
> > > registration time.
> > > 
> > > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> > 
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter, Michael,
> 
> Which tree is taking this series?
> 
The series includes non-watchdog changes, so my expectation was that some
other tree would take it.

Guenter

> watchdog-next or PPC development?
> 
> -Scott
