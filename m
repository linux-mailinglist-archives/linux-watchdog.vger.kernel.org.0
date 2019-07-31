Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2657C907
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 18:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfGaQnq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 12:43:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42780 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbfGaQnj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 12:43:39 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so32169391pff.9;
        Wed, 31 Jul 2019 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dUNFdN6DiR2HTjlajr62FaV7YbxRxOVNxB6akEc8IzE=;
        b=UfFD539jtnd9rBd5++QIiFVmMCS0rGi6TFi1zWK5nZuTAnnvEwRNOj7s9+86h4FbBj
         QhAY/KT2h68/eDOKtL4NlhZlWqxt95qCGTS0weQB+7akD6ForW1gKMtrLSS6vTwNSH4s
         rn6vT2sCVaxqsmP2ofzGAOeDBHxDN+EpU1s7OUSArTAkgUPE6FP76WbBd/ifFMSwC4wE
         1OaSCXm2h2nv613AZYGYSRRKHarNOtJUG9z08d+v+3zf0osz+jexaFzocMRoMy5e/mkf
         6qG6GDoOmZhDgHuVD0Wwm7ku1CLBmxetAFtD4qToemQjt6SZkv/OXnk/FGRNSMJRKgg4
         iguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dUNFdN6DiR2HTjlajr62FaV7YbxRxOVNxB6akEc8IzE=;
        b=SwYQMgQaewh5F4EsvLPP8KkJ4ArW3XICRHRBArGxl59u+e7+Q13NlIIq8fGIyr5ozP
         goOg9KI2T7B1WjPQUA/MMF3FqvsEaC69bkcTBm+6yWzEuamn8Rd9jr5LxPML2zSDU+ej
         X5HD+X2Z+OZeAbOnomjtBe+GDsY3NIDRff76WGz85CZXt4gjsP/NzrmW6RolUakFAUiY
         0/eruJ20njA/bVjNU7L1F99Ub9ZhRP55+8x9AD+8vAZ5Dcjsp1FzApW9veADZM3bMi9+
         p6B0L8bStrNYb9l9LOrTSpoPHncMkb0yf00iEZyZfMxGNqykGzzR5AN4S9UzU7lucMvj
         BCNQ==
X-Gm-Message-State: APjAAAWTXlPYE7/KrH9L5THu0H2R08iBbD+yrPsenncezYi0xRrxvIsL
        YJWLGp1j5xSbXjS10sz4X2eykwAi
X-Google-Smtp-Source: APXvYqz7MUmHiRgps8HbXXSoRlnaZ02BToAVxnsFBRbRnKGvRA4JqpH/FlawNwLG0rijMXSUo+R4aQ==
X-Received: by 2002:a62:be0c:: with SMTP id l12mr48704886pff.224.1564591418785;
        Wed, 31 Jul 2019 09:43:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23sm72981420pfn.176.2019.07.31.09.43.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 09:43:38 -0700 (PDT)
Date:   Wed, 31 Jul 2019 09:43:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.
Message-ID: <20190731164337.GA13646@roeck-us.net>
References: <20190718155238.3066-1-mbalant3@gmail.com>
 <20190718163458.GA18125@roeck-us.net>
 <alpine.DEB.2.21.1907310911120.29703@mbalantz-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907310911120.29703@mbalantz-desktop>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Mark,

On Wed, Jul 31, 2019 at 09:17:13AM -0700, Mark Balantzyan wrote:
> Hi Guenter,
> 
> If it's not too much too ask, I also propose to rewrite alim1535_wdt to use
> the watchdog subsystem as I believe we are making progress toward the
> similar end in pc87413_wdt, as my evaluation ends in some weeks.
> 

Please, no. We still have ways to go with that one driver, and we'll be
stuck with a patch which I can't accept because of lack of testing.
I (and you) really need to talk to your evaluators why they ask you
to make those changes. This is highly inappropriate. The Linux kernel
is not an feasible target for such an evaluation. This is setting
you up for failure, and it is a waste of both your and my time.

Are you really working for or on belalf of the Linux Foundation ?
They should know better. And if Google is involved, I am embarassed
for my employer.  If they really want people to do work like this,
they should also provide reviewers and coaching staff. They should
most definitely not expect kernel maintainers to do it for them.

Thanks,
Guenter
