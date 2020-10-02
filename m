Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21736281961
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 19:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbgJBRhJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 13:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgJBRhJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 13:37:09 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEBEC0613D0;
        Fri,  2 Oct 2020 10:37:05 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id m128so1982126oig.7;
        Fri, 02 Oct 2020 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hUOyiDlGxtVYCkFUlhAd55rFu3JXozDtPtR2lsh7Bn4=;
        b=VvYITN5dJbSa2AAHUrZJ+HkBWRSMjGIg+dZ4EwhTxTg85xAOp9yFLwNSdeCZOt82P/
         Fdsgq87Ij8J+1rImho+HXblPqF+OUQ1oxqmZf+vccNNbyXAwcnPmPx70DGUOkkw63pZ0
         SJYRgB578/VKkUcvAUFL4i9ozGdR6ApHSCzqn+6dUCeRCHrYyMGBEs0bJEDlW2iUY+RO
         cn0VC6cAHSL6VYfPXh1fAWLWZAzvLZ5pRpqmuHx75PHdrgcRs6UtFi5zA/nAwDXerwTo
         nvs0UQCk9AClfzs1HHz8PafkfsAVeMk+ur6dJmtQEXA87xE/2769uU0V3VkndYR1hFEQ
         HvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hUOyiDlGxtVYCkFUlhAd55rFu3JXozDtPtR2lsh7Bn4=;
        b=czSod3xGWxAu24+NjJE6+lmpWabuSYk1bHKrBQnWQ80EAjrU+XvlV7ANobA2OHCwY8
         MdF6jQVaa1o1ckXFgi0CfhUeaubzpmKSSTD4bynoKK73ESPwZDx/EVbZIy9KKNrNzEoB
         UDoBYJYnMnfWpCFXGwm1yuV/siYqVP27lBXMG3If80H0o+p+JzGkdFDnAN0BHUOCdOqk
         kVfUQ3ctIQBoPmAQCtfrsgnJoFNjcmmNHPa1HePoO0U7hQfY1GPMamuwLVO7iOt4T9PH
         Yp9JhE599rcBLLP6TJrTLfld8NQZ+QbwCSRjRSmtItdnxObvWgRsl7Zw7bF7oB53ZQmb
         EhBg==
X-Gm-Message-State: AOAM531+gG28AccAVJglDYQAd5JnW0ekGjUPzUJ1gr7NW5oiE2bTKvFM
        d1+BFdgm8bSLvAwZ3Ax+uc8=
X-Google-Smtp-Source: ABdhPJy12xAyjffG45w32N7JyLvOfly4SIVNYL1rcoYbFQb7I7Bob08T+YgAHRn4pox18eycnLOXYg==
X-Received: by 2002:aca:1717:: with SMTP id j23mr1794097oii.61.1601660224509;
        Fri, 02 Oct 2020 10:37:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u9sm531964otq.54.2020.10.02.10.37.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 10:37:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Oct 2020 10:37:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: cadence: Simplify with dev_err_probe()
Message-ID: <20201002173702.GA51198@roeck-us.net>
References: <20200901153141.18960-1-krzk@kernel.org>
 <20200901154952.GA106798@roeck-us.net>
 <20201002163124.GB6464@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002163124.GB6464@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 02, 2020 at 06:31:24PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2020 at 08:49:52AM -0700, Guenter Roeck wrote:
> > On Tue, Sep 01, 2020 at 05:31:39PM +0200, Krzysztof Kozlowski wrote:
> > > Common pattern of handling deferred probe can be simplified with
> > > dev_err_probe().  Less code and the error value gets printed.
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks for the review. Who could pick up these patches?
> 

They are queued up in my watchdog-next branch, and Wim usually
picks up patches from there.

Guenter
