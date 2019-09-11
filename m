Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B60B032A
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2019 19:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbfIKRy5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Sep 2019 13:54:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40768 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729352AbfIKRy5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Sep 2019 13:54:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so14161333pfb.7;
        Wed, 11 Sep 2019 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hVAmdWRlaxMqfcknDHMrIO4GwZviw2k7zF3Deg03FGs=;
        b=Jtm7zYN/3BPBHV71cSqvO7q3OxMIAkTDNLyHSKVttZKkze0neUTRRu+k9y9nUDPEIJ
         4QnZEeEU8MX+GWmV3XSfBVHtsIjkzHwhIM2Z9oYyz5jMPg7zNyBYbMyaT91v89Mik2gM
         /qdyt0i2kxDHF7y5LUTfXkfwA+LEwPLGZ+mbvB9TlO8Wxh+9Kp7Q2cr2B5xxGBiCB3Nb
         HgPf7XQfXO7AOnjDwLWcmBsHz4oe4USv7/RZB5EzmbiQcm0/p/yfwa82yDlS+frVk/RY
         beFTBN0aIaRW01N9AFgUJQzTvKThoUUseeVOkehN458v1qRTAC9Lxv54RznIZl5VdS6G
         GNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hVAmdWRlaxMqfcknDHMrIO4GwZviw2k7zF3Deg03FGs=;
        b=fowUJ/EehU/lyjcvLqzYGL/ix0P7vhxHJgiNLd5YqVkIizXbrWtXVIM5iMBGE7Dz7f
         T9saOBpqceLMsvt8yhrQsNica1izQ967GYBlE3UjcSl5yMntNbBjML/dSN0KV4mbddaJ
         y6aebqASBkmNP7whU9N6hdMJ90tyGyyBD4R7XrV1PjTCXzjE5AMvvS9KxrRdxc1Zx4m5
         /c/LC5YNZyAGxxokNBRCNgf55E8Jz8CXDGM485wtGs1jyETY6+ROwtguAvxgW8ZtXvjG
         rlAgmSk1E7EFb05h0D5+oIsoEgdOtFY/itcA8noyxQloRJ5SaW19BSPQcufufmwFLhjj
         t+tQ==
X-Gm-Message-State: APjAAAWjXeB+GU7L5+6dOq1jIrg8cChxo/Ffp48IU9ufWfSJjFXirWbR
        KhcKqqTGEPuPH3NrgMbLJXs6VuTw
X-Google-Smtp-Source: APXvYqy2FvuGYRN6QinUeQL+5/39/wahbZLGdnRk9wVpivns5lnmWAojDdnq8q10lpLzdfR2JkoH7w==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr6821217pjg.80.1568224496232;
        Wed, 11 Sep 2019 10:54:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k4sm4911733pfa.95.2019.09.11.10.54.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 10:54:54 -0700 (PDT)
Date:   Wed, 11 Sep 2019 10:54:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] watchdog: pm8916_wdt: fix pretimeout registration
 flow
Message-ID: <20190911175453.GA31612@roeck-us.net>
References: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
 <4231aab1-c538-a14f-cea1-ceb28781c7bb@roeck-us.net>
 <CAMZdPi-P_AopbbyJEWDbnm7X8MtxTzs=MN13+UFndL2OK5VReg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi-P_AopbbyJEWDbnm7X8MtxTzs=MN13+UFndL2OK5VReg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Sep 11, 2019 at 10:04:12AM +0200, Loic Poulain wrote:
> Hi Guenter, Jorge,
> 
> On Mon, 9 Sep 2019 at 00:50, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > On 9/6/19 1:30 PM, Jorge Ramirez-Ortiz wrote:
> > > When an IRQ is present in the dts, the probe function shall fail if
> > > the interrupt can not be registered.
> > >
> >
> > The author intended differently, and did not want registration to fail
> > in this situation, following the logic that it is better to have a
> > standard watchdog without pretimeout than no watchdog at all.
> >
> 
> Indeed, but I tend to agree with this change since it aligns behavior with
> other
> watchdog drivers and I assume there is a serious issue if request_irq fails.
> I suggest adding a dev_err message in such case.
> 
> Copying the author; I am not inclined to accept such a change without
> > input from the driver author.
> >
> > Similar, for the deferred probe, we'll need to know from the driver author
> > if this is a concern. In general it is, but there are cases where
> > -EPROBE_DEFFER is never returned in practice (eg for some SoC watchdog
> > drivers).
> >
> 
> The IRQ controller is the SPMI bus parent node whose driver (MFD_SPMI_PMIC)
> is a direct dependency of pm8916_wdt. I'm not sure in which scenario this
> could
> happen.
> 
Not sure what the action item is. Accept the patch as-is (Reviewed-by
appreciated), or resubmit without the -EPROBE_DEFER check ?

Thanks,
Guenter
