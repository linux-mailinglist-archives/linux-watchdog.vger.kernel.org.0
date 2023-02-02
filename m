Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E0B6882E3
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Feb 2023 16:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjBBPnK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Feb 2023 10:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjBBPnJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Feb 2023 10:43:09 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20076CCA8
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Feb 2023 07:42:41 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id r192-20020a4a37c9000000b00517677496d0so207913oor.13
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Feb 2023 07:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnZLle+ugO+tSPAUH3VK9XKqwpCyKoG/sjBCov6TzWg=;
        b=Ao58aStMlKEbdnT0dtC86iRh9BDSqzOSy4o8bZkexkXFhnz7ZmB1mBWpUDI/zinJCA
         rB6+7DjqGF9ER/Prf6vmjbYlLVpZ5PHStfteBJpSv5np+P4a3UNCH5EdPrRgsLVxhlG3
         QmTuNzr1qVFWGTFQh90jCkiYOkgMIlrYCSZHO6TJs4JTTkRXhjGNAIRjr6vC7JNhYL3S
         S4uI+XM2g2c95h5ve2cH/Qco/XPC5Nm6iQBSJo4lzl0xXhEJG2UNZC9xFaNU0onOiWVX
         fVzLcTzM6jNdnfnN1f6CrtOZCdh/0+IhP6fiv8sLQGnSYqmb9uLwI2tplh8ZrkSyAOAu
         qnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnZLle+ugO+tSPAUH3VK9XKqwpCyKoG/sjBCov6TzWg=;
        b=WEOFjZPvN+aUg1w4VEBG/ZT2lw8sqrLPnmupujFeKxPeo/nRQKPkwog4JCnY2rhnY5
         jcmxEsmZ3orKl+Gv6MbIw/Z0jmbQ4r/FyVRe2esq+e2S54qrQXfoe7mNIrn1kzzxyEYE
         cvgWE7CCC7Taf7BI5HDAMH+U79DQhyWSLZl3EZ2VArssNA2axhR8LvZwS1GhmUs6bVpP
         +fvMjcXFZLoigJQylaL7n5fWT73T8gLNTjDGoykykj1qh/YkaOJCwQDO3XXYyvUzpmv8
         5Z7+oMFN3TFMWjWeYPo9SN0s2L68GpB9z7BpE+y0+/0CT1abS2QhsA0K0GPL10Z+gg9S
         G7cw==
X-Gm-Message-State: AO0yUKW15i2ykH7YAKVBgu7jfGfQ7P51y4NU2fzxuV88A+uBSxfg59L3
        desG3hjreu7BhgngnjVASWB1tXGPQnk=
X-Google-Smtp-Source: AK7set8W48VLBMFi7anxgs1lPQ0/ts++gobQxbQlW3YSEB/mA/EU2AjAAjKKiDiPAehAG2Xejv7KXA==
X-Received: by 2002:a4a:d2d9:0:b0:517:7c09:522a with SMTP id j25-20020a4ad2d9000000b005177c09522amr3738962oos.7.1675352484516;
        Thu, 02 Feb 2023 07:41:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s22-20020a4ae496000000b00500c1100651sm8564684oov.45.2023.02.02.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:41:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 2 Feb 2023 07:41:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH -next] watchdog: diag288_wdt: use kmemdup() to allocate
 memory
Message-ID: <20230202154122.GA1373010@roeck-us.net>
References: <20230202074127.4108100-1-yangyingliang@huawei.com>
 <Y9u4/amCdKDz5L2J@osiris>
 <6f80303d-fe26-a2af-a1fa-e99c00da9a81@roeck-us.net>
 <Y9vDYOxWqAvva3hL@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9vDYOxWqAvva3hL@osiris>
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

On Thu, Feb 02, 2023 at 03:06:24PM +0100, Heiko Carstens wrote:
> On Thu, Feb 02, 2023 at 05:35:40AM -0800, Guenter Roeck wrote:
> > On 2/2/23 05:22, Heiko Carstens wrote:
> > > On Thu, Feb 02, 2023 at 03:41:27PM +0800, Yang Yingliang wrote:
> > > > Use kmemdup() helper instead of open-coding to simplify
> > > > the code when allocating ebc_cmd.
> > > > 
> > > > Generated by: scripts/coccinelle/api/memdup.cocci
> > > > 
> > > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > > ---
> > > >   drivers/watchdog/diag288_wdt.c | 3 +--
> > > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > Thanks, but this code will be changed differently with the next merge
> > > window. Therefore I will not apply patch.
> > 
> > It looks like you decided to bypass even sending your patches to the watchdog
> > mailing list. I know I have not been as responsive there as I should be,
> > but that it no reason to bypass the maintainers completely.
> 
> This is s390 only code which is broken. I doubt that anybody cares
> about s390 specific inline assemblies.
> 

s/s390/<pick your platform>/g

I guess with that logic we can abolish watchdog subsystem maintenance
pretty much completely. After all, pretty much all watchdogs are
only of interest for a limited audience.

Guenter
