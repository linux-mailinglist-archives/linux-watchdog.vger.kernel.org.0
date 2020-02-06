Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D97A154D50
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 21:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgBFUq0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 15:46:26 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35955 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgBFUqV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 15:46:21 -0500
Received: by mail-pf1-f195.google.com with SMTP id 185so59054pfv.3;
        Thu, 06 Feb 2020 12:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ug/wlo0Kk7ZmWuOhLjsGf8WpCyfYM5yOAezTl3oLxGE=;
        b=PKgrnsV5MKiUZIMMv8THQCJTRF/OfN/A2C2Uz0slq+rnPdh1JeeJtHSPDRphIcio+0
         MeryKD3yM6dqE/SC+j55EOXV7JQw2OXW675E3qs8H7PFZBr6cmQ9I5k1ePyMMMhOZT/3
         nDaScFYIicxyK8eJel8Rur3dtlwKwb/FgIKWZICxE42HbkuK34vj3c6hh350lY02D5N+
         HcK0hHtqk7lz+99hEYwPJA/eO/DqYbDIXbHROjZDPZrDBpJdM37llOW+vUWlL3tyCq3m
         QWQRUdmdW78uFj4dZOvy5QrN7S5RT+fYv2+ZN86VMFyQ4hDwVUMGrDIT2mv/UsZ1JqnX
         Bwxw==
X-Gm-Message-State: APjAAAVfOduh9fRLaV0hRJzxa0/+wc3yxYkGsQZnY3HZLEeFl4cDvUS0
        6e3B8v203iB7SxQ5jm9QCA==
X-Google-Smtp-Source: APXvYqzR75X0SOO8/Ci8hfXh+3pGKYvyPgI2KQi3sQN7ajgY/oC7QShvBli/8QrnOI53l84UKQeUKg==
X-Received: by 2002:a65:4d0d:: with SMTP id i13mr3719314pgt.346.1581021981006;
        Thu, 06 Feb 2020 12:46:21 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id a21sm287558pgd.12.2020.02.06.12.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:46:19 -0800 (PST)
Received: (nullmailer pid 28310 invoked by uid 1000);
        Thu, 06 Feb 2020 19:15:32 -0000
Date:   Thu, 6 Feb 2020 19:15:32 +0000
From:   Rob Herring <robh@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: watchdog: qcom-wdt: Remove deprecated
 compatible
Message-ID: <20200206191532.GA24542@bogus>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
 <20200204152104.13278-2-ansuelsmth@gmail.com>
 <20200204160958.GB17320@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204160958.GB17320@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 08:09:58AM -0800, Guenter Roeck wrote:
> On Tue, Feb 04, 2020 at 04:21:02PM +0100, Ansuel Smith wrote:
> > "qcom,kpss-wdt-msm8960"
> > "qcom,kpss-wdt-apq8064"
> > "qcom,kpss-wdt-ipq8064"
> > "qcom,kpss-wdt-ipq4019"
> > 
> > and deprectaed and not used in the driver code at all. Drop them and
> > fix the example.
> > 
> Rob may correct me, but I don't think you can just remove
> deprecated properties. It doesn't matter if the driver supports
> it or not; after all, DT property descriptions are supposed
> to be OS independent.

Right.

Also, there's a conversion of this to schema under review, so it will 
need to be refactored if not dropped.

Rob
