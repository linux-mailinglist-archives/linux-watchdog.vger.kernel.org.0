Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9505B38BC9B
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 04:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbhEUCpi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 22:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhEUCpi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 22:45:38 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31461C061574;
        Thu, 20 May 2021 19:44:15 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so16752762otg.2;
        Thu, 20 May 2021 19:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jcC2BPhSP2NvMB3uO6t0baUfqnJrAZMwkJkg1IIVnrY=;
        b=Or5JnTkDwo19CAzUVzfCSWaeYp7BhKjQH9H9APPDAsZi+K4n55OcJ7OjbLYBWWe3c8
         kIcWSMKfs5QZkDil1YvnvcTFG2rpKCTHoARKWAu0G49BpsjyW7pwb0dJ3SHTaFVKSXDo
         S9NPScpClLeS4d4S+dE5lsmsOudA2NddGf/8YsJQhoFRNbiADPKrt1n1I1fcd9utYunH
         oqM6tb4xOAZKF2MUZ9amRVE4Zjao/ei6vjEsEsCVRqs9USI2LuNGuJlMUk70LOq+Z8UP
         kUi8GrTEm5a34JJZmsAhDWUuVHQsLMNJCmCFJilKgMsPZ51GO4zInFyEQf1nTN3K0j6w
         6+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=jcC2BPhSP2NvMB3uO6t0baUfqnJrAZMwkJkg1IIVnrY=;
        b=IvuuLwqXmIqXZSDQbJcf9HzE4OKWKOnh+uqfgxEZ7cVDkNEXfr4IqE8Ya9ntivGKy6
         eJ+sNqbH+ubH3hnJNMJTtIzSHQqCgkd5se4xXj1SSBt1G5yonYOjkLJpXHlk3sqZDxaS
         5qIqwh/8cIm3auMM9+YQIsugPuctQPiwv9ygtSfB3tr7OuJXDqS8cKIEI8UIU7F2y4zy
         Da/MIM02NJblRUz88fPdcZ1iDOkU7jPCVQMwKOkrc2flR6f3acQHuKq8YWQiko2TDr8a
         LFxUhTyVuCh7KLN1reVqjjVXpvS6tTAWSsHKzdl+1X+xzYlQV/JO1AuMTeVzR80o+gnw
         GC5g==
X-Gm-Message-State: AOAM533SWDBmZUHamY0TxLcOSEXwwHpWIe7y0ncC/ltVFYpMHxeq/gat
        S+g5jrt7yA0c2cgguxEjyB0=
X-Google-Smtp-Source: ABdhPJyU5xC3uLF/gHpo7/4DLq7k50dsX1NXyEpLLTlLM+N3Af9OUbfYSVNq/v0+66OfeSCLZwnE6A==
X-Received: by 2002:a05:6830:1df7:: with SMTP id b23mr6226393otj.163.1621565054401;
        Thu, 20 May 2021 19:44:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9sm772536oto.79.2021.05.20.19.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 19:44:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 20 May 2021 19:44:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tao Ren <rentao.bupt@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>,
        Amithash Prasad <amithash@fb.com>
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210521024412.GA3004726@roeck-us.net>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
 <20210417042048.GA109800@roeck-us.net>
 <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 20, 2021 at 06:51:53PM -0700, Tao Ren wrote:
> Hi Wim,
> 
> Not sure if I looked at the wrong repository/branch, and looks like the
> patch is not included. Do you have any further suggestions? Or should I
> send out v2 in case it's missed?
> 

Wim didn't send a pull request in this release cycle. I have the patch in
my watchdog-next branch, so he'll hopefully pick it up from there at some
point.

Resending the patch would just create noise at this point; please don't
do that.

Guenter
