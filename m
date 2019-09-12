Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77DEB147C
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2019 20:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfILSej (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Sep 2019 14:34:39 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43469 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfILSei (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Sep 2019 14:34:38 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so12138907pld.10;
        Thu, 12 Sep 2019 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0NsNEAUZ0Crnd+Dr07/EE6yGUJNjNyQsJ9LixZ3AYBk=;
        b=QCadSE/h+WLe3KRnzUxywPKimE34rq2JsyZQmRVzAk5IwhygxT3DXRIsQ2u8QaaL9s
         m1PhsBQBJ4rfHYyDdNlbzIuS/zklzrU4FXcAAc4um9qH3blhL4f1v/T6cV6mJdm7eGvb
         YuD+kKkM/GwZxfWJdx0ZFo2K19LDzV3Dn4a2qMSCa/UZch/K16B8s9KZQc/z7YEI7FU1
         AsY6dEVLGXjjnxM5ty3LO9i/U4FitSHSojnHPxiW/pfECOTkp8reOYpQyQD2ngC4RQ0p
         3dvUYdzyIZN+xsVxhZdglprL9OH95BgW4/WUPQilBoJQ2BB4uXbyIJmEbiHJbZ0OPfPf
         cwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0NsNEAUZ0Crnd+Dr07/EE6yGUJNjNyQsJ9LixZ3AYBk=;
        b=cCdtT1dJ6NWysgXuP9TwZ5H3hFe9h6dvh1UUxlw0Ov/y8/QZCqdvU7q4c1KrZP1IJw
         0y9B/TgQi0uwCRkH/U/B7NoMbx2NdQcjU7saCqriJTQwoVBirEv4kqnRNnyqzwndZ7Db
         3fe5GpqFE7fW27rmLyiOWkyEhqVmrpFSfdpDrUfGpBOSXkf6JtS+sEqoVPaAq/cw7SzB
         KW6fo1p+5Xk5hGMe5TecS57RPTIlRWngiO96KZP0XK2EkozFrTiK5zP/MTWuW2s8fiVO
         bNX1HuNeoC935lSd+pi00mzKIFL5pJ58d5iNetwfrE4xAlvIZ3KQMJGIIMDDvW9A+khf
         kcEg==
X-Gm-Message-State: APjAAAX4608UtgALGz0gV8j/jdTPs8ROAh2FG+Uh5tr3kTIGE/zbSEGH
        ZkZKIBy71NcevFv24RpuN94=
X-Google-Smtp-Source: APXvYqzxRpsshcfcA0i0pqzMLG6IutkR305eKHGsQ2JWDSwpEi7peKrNpJOhCCJq+23ayYPtZeK14w==
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr44838169plp.217.1568313276613;
        Thu, 12 Sep 2019 11:34:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5sm45646907pfp.38.2019.09.12.11.34.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 11:34:35 -0700 (PDT)
Date:   Thu, 12 Sep 2019 11:34:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: qcom: support pre-timeout when the bark
 irq is available
Message-ID: <20190912183435.GB5065@roeck-us.net>
References: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
 <20190906205411.31666-2-jorge.ramirez-ortiz@linaro.org>
 <20190910180655.GA25286@roeck-us.net>
 <20190912072454.GA11651@igloo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912072454.GA11651@igloo>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 12, 2019 at 09:24:54AM +0200, Jorge Ramirez-Ortiz, Linaro wrote:
> On 10/09/19 11:06:55, Guenter Roeck wrote:
> > On Fri, Sep 06, 2019 at 10:54:10PM +0200, Jorge Ramirez-Ortiz wrote:
> > > Use the bark interrupt as the pre-timeout notifier whenever this
> > > interrupt is available.
> > > 
> > > By default, the pretimeout notification shall occur one second earlier
> > > than the timeout.
> > > 
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > 
> > Nitpick below, otherwise:
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > > +		wdt->wdd.pretimeout = 0;
> > 
> > It is not necessary to set pretimeout to 0; the data structure was
> > allocated with devm_kzalloc(). The compiler won't know that and
> > generate unnecessary code otherwise.
> 
> will you need me to send another version or could you pick it up as is?
> 

I applied the patch to my watchdog-next branch, with the line removed.
Let's assume that Wim will pick it up from there. If not, and
the line stays in, no real damage.

In short, no need to resubmit.

Guenter
