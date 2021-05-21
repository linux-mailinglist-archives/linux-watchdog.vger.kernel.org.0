Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BC838BCAD
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 04:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhEUDBR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 23:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbhEUDBQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 23:01:16 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B17C061574;
        Thu, 20 May 2021 19:59:53 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y15so2483521pfn.13;
        Thu, 20 May 2021 19:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bNbYR9JbwfZkXn8zhgxSPHGRk+wq1MKkziL+l6LqDPg=;
        b=ajZiMQH14DX2f8eFpjpv6INp+MxcSxkanvspV5UPP0SUBoWwoOpvmVNZ38RuL5Kl2G
         VhoSyjDBMe/MvRCiPBDiinNmP+860EELmWie4TmnpftFJ//2XdLSMS2hAKEx5GQv9RhP
         xmWjjmNmjP/ZTHBh48k9nXKn88w8OwNV4HpPYisDDfxIgHZuef9gWL8RZx1GRUTTxWXQ
         NBMbcD4Sz8/Wbr5R3EXhmhH9JYn1K7Pj1kPbMiSq+j2ksB6SqZuxVVYD8uVfEaHYSiMF
         RMuSP+AwuRrltoNH7sGgQM22SjI8ay+BWQPyKdJKIdE6k88xOhdHeeCDqcaYI36anZF3
         98wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bNbYR9JbwfZkXn8zhgxSPHGRk+wq1MKkziL+l6LqDPg=;
        b=cB6X1qvxbUyahzGXaE+c3b/4EFIZlIHBUOEvZRj6T8Z2ihFng8Kv1v5LcpDs+8Sc5u
         AdwEV5/xqylFdM9V4iZC7/P8nxVOCkCcmTOjWE1GR9Z0lr847MkQXwLXnsju0yTloAZw
         KtDic3lbJHG+oDQTt5s1CUZa5EFF9JuwXSks8BKiPbKuRaeyppX7CxNAM1O4dE9ZMIQf
         h488479T5LuV5HZyqZPHGjshuv7Iwc59h3fUKu3wI8l9vW3EN22DXmUjip4bKMhG/7zc
         sy7ocdWkonvwky4wyKGdxMidbp0xR2CY3K/kS039VoCtEDAmxpGRGRbbDp7nqIv+6fcZ
         7DTA==
X-Gm-Message-State: AOAM531bCpO6Y6pJGitOrtnGaNOqRWbzIXFnp8pSI7fTa0QwXRcslI9j
        kpTYMSak/VFvQAAeJwYcE4dSdCfZq2FBV8/IvNs=
X-Google-Smtp-Source: ABdhPJzeRIgNVMmtqCUFR4GUjPqKdMdD2zybgZ3+xdcvECerOxgxbpnDciqXgp3lJheKEpOt3A+U1w==
X-Received: by 2002:a63:cd01:: with SMTP id i1mr4723979pgg.294.1621565993099;
        Thu, 20 May 2021 19:59:53 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id 128sm3048945pfy.194.2021.05.20.19.59.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 19:59:52 -0700 (PDT)
Date:   Thu, 20 May 2021 19:59:44 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>,
        Amithash Prasad <amithash@fb.com>
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210521025944.GA3450@taoren-ubuntu-R90MNF91>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
 <20210417042048.GA109800@roeck-us.net>
 <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
 <20210521024412.GA3004726@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521024412.GA3004726@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 20, 2021 at 07:44:12PM -0700, Guenter Roeck wrote:
> On Thu, May 20, 2021 at 06:51:53PM -0700, Tao Ren wrote:
> > Hi Wim,
> > 
> > Not sure if I looked at the wrong repository/branch, and looks like the
> > patch is not included. Do you have any further suggestions? Or should I
> > send out v2 in case it's missed?
> > 
> 
> Wim didn't send a pull request in this release cycle. I have the patch in
> my watchdog-next branch, so he'll hopefully pick it up from there at some
> point.
> 
> Resending the patch would just create noise at this point; please don't
> do that.
> 
> Guenter

Got it. Thanks Guenter.

- Tao
