Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A747136799
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 00:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfFEWvI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 18:51:08 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39286 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFEWvH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 18:51:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so95249plm.6;
        Wed, 05 Jun 2019 15:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m6NM6vRBvsiR62/PiVaQJ+iB4s1JWoehmtKqPMKeEx8=;
        b=S1d4XTzSyWmOYkqplUx/0vq7Xx0Je8vhBd8UGJUrNr6Sq/4+ToclB0jZS0YTUOVqrv
         Cng7+tgqWmZPqtDfkJ4Bg0M0HgDMjID8suKpCT4IUPrzoB+fUWZtLUH2PW+usNe41SLt
         5r87ueubtDiWckZw2uS76UKIGr7ghn3LKLQYDjLlf6tQLKYezTByY7DznzAVlxMMYaSQ
         265frOnEp4l/7aapqyX/cHWEshw4dcMehgDWHuWO8VEVT5P4ZupyXjaWeJC+Nd6AtsVb
         Q2QAiIk8fZjN1Fq5OrbHQzwmpOroFbB3rFMtvX6GGOabgkOJSnlYjcSArm5LHojPhfd6
         RwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=m6NM6vRBvsiR62/PiVaQJ+iB4s1JWoehmtKqPMKeEx8=;
        b=n0/vK6Hzx8yLco8m1+X0VsZGwMeut8LAGhLSqqaWV4SinZZxPreKRUxmvD83gS2Umb
         TrqkP1hQm1nvnV/HpKRlpn5+G1wJp9cia3Wfpvax7tCS4ERXXr+zeIavKb2CPtewTpFy
         2MERJuNzDuxJS857EsGHMh8NgzwoQgvOZiItML1yr34EwKV848p9rTTchkRGD9gxmOdm
         NeWwrJK/RcJ++g6itTYMNSixKa14kOXskwUkAAE+tG8lf5iUUu2S3Bo0AWW9Q3h8qb7c
         2puL4YKdrv6jY0jMXZO1hVJFXEPciIfUe5RVMpVEZSJRVIBFXUfSa0S7b5ImQcnkyVws
         Jn8Q==
X-Gm-Message-State: APjAAAXe8QJJ/gExy7ea2VDudjzdUvN80IQG501iIvnB+ljC+95UxsB3
        MKSjPbY3HquVeR6HnLdM3t9MIRkA
X-Google-Smtp-Source: APXvYqxgcKHEEInuS4NNgzBp8UXPMb4hw072HDdBCdISx0NH00LSY0tF4dh91lz6fWmou4XVJ3dUCQ==
X-Received: by 2002:a17:902:6ac4:: with SMTP id i4mr44287074plt.75.1559775066982;
        Wed, 05 Jun 2019 15:51:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c142sm6047pfb.171.2019.06.05.15.51.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 15:51:06 -0700 (PDT)
Date:   Wed, 5 Jun 2019 15:51:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] watchdog/hpwdt: cleanups and kdump accommodations
Message-ID: <20190605225105.GB25183@roeck-us.net>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
 <20190605223102.GA23382@anatevka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605223102.GA23382@anatevka>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 05, 2019 at 04:31:03PM -0600, Jerry Hoemann wrote:
> On Fri, May 17, 2019 at 02:59:37PM -0600, Jerry Hoemann wrote:
> > First two changes makes hpwdt more generic.
> > Next two changes make hpwdt work better with kdump.
> > 
> 
> Hi Guenter,
> 
> Did you have feedback on this patch set?
> 
I have been out on vacation, and I am still digging myself out of a big hole.

Guenter

> Thanks
> 
> Jerry
> 
> 
> > 
> > Jerry Hoemann (6):
> >   watchdog/hpwdt: Stop hpwdt on unregister.
> >   watchdog/hpwdt: Advertize max_hw_heartbeat_ms
> >   watchdog/hpwdt: Have core ping watchdog.
> >   watchdog/hpwdt: Add module parameter kdumptimeout.
> >   watchdog/hpwdt: Update documentation
> >   watchdog/hpwdt: Reflect changes
> > 
> >  Documentation/watchdog/hpwdt.txt |  4 +++
> >  drivers/watchdog/hpwdt.c         | 55 ++++++++++++++++++++++++++++++----------
> >  2 files changed, 45 insertions(+), 14 deletions(-)
> > 
> > -- 
> > 1.8.3.1
> 
> -- 
> 
> -----------------------------------------------------------------------------
> Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
> -----------------------------------------------------------------------------
