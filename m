Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFB59B2D8
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Aug 2019 16:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfHWO6i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Aug 2019 10:58:38 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:34914 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726043AbfHWO6i (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Aug 2019 10:58:38 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id B7CB442ECA;
        Fri, 23 Aug 2019 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:references:in-reply-to:date:date:from
        :from:subject:subject:message-id:received:received:received; s=
        mta-01; t=1566572314; x=1568386715; bh=2ywvpDww2A1i+kbuWuDHnXybr
        Ba2cGJLERdeg5sc8R0=; b=lu7OKXSthWV58HC/Hipuf12hDFrQuAuUUj8iMMjHD
        7Ii0aiwZktZCFPATQUBWUKTamtPTy2BlUt7iM+vArJ1PsQUEdCiCZKJzGaXx42/U
        wLOkg63mPxT7odCfSJ7IWL9p1AiVI1/LtFMaNZIBHdNNvfW9WvxDCTSj+fh2G4kn
        n4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 614TsZo-FET2; Fri, 23 Aug 2019 17:58:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 29DF34120B;
        Fri, 23 Aug 2019 17:58:33 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 23 Aug 2019 17:58:32 +0300
Message-ID: <8690cbb3e7759f3d8ab2a93db53186bf02fd525a.camel@yadro.com>
Subject: Re: [PATCH v1 3/3] watchdog/aspeed: add support for dual boot
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>,
        <openbmc@lists.ozlabs.org>
Date:   Fri, 23 Aug 2019 17:58:32 +0300
In-Reply-To: <20190823141930.GA11610@roeck-us.net>
References: <fafd757238e204b2566f216f1d6a4bef4b4906c5.camel@yadro.com>
         <20190823141930.GA11610@roeck-us.net>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 2019-08-23 at 07:19 -0700, Guenter Roeck wrote:
> >  
> > +/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
> > +static ssize_t access_cs0_show(struct device *dev,
> > +		struct device_attribute *attr, char *buf)
> > +{
> > +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> > +
> 
> Unnecessary empty line.
> 

Ok, will cut.

> > +static ssize_t access_cs0_store(struct device *dev,
> > +			      struct device_attribute *attr,
> > +			      const char *buf, size_t size)
> > +{
> > +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> > +	unsigned long val = 0;
> 
> Unnecessary initialization.

So, you're saying 'unsigned long val;' is enough? Will do then.

> 
> So the attribute would only exist if the boot was from the secondary
> flash, and it would exist even if it wasn't needed (ie on ast2500 /
> ast2600)?
Yes, only at secondary flash it will be available.
Also, found out that is for 2600 aspeed completely changed the process of
switch. For 2500 it just swaps chipselects back to make it accordingly as at
first side, on idea it may be helpful.

May be some approach like this will suffice?
if ((of_device_is_compatible(np, "aspeed,ast2400-wdt") or
(of_device_is_compatible(np, "aspeed,ast2500-wdt"))
	wdt->wdd.groups = bswitch_groups;


>  Well, if that is what you want, who am I to argue, but
> you'll have to document it accordingly. When you do so, please also
> document what happens on ast2500 / ast2600 when the attribute exists
> and is written.
> 

Ok, I'll put it in Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
for next patch set.

