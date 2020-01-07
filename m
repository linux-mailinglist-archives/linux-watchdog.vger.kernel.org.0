Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFD1132E6B
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jan 2020 19:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgAGS3q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jan 2020 13:29:46 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33701 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbgAGS3q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jan 2020 13:29:46 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay11so32016plb.0;
        Tue, 07 Jan 2020 10:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R00xNPsCF8UW/szKUy4WCcj0M7xSEsY8VrV3QDe1Oo0=;
        b=CYAMnJvk6SbEGhlwkKO0AU34UPtn7TFji5Ps19RbS8eRYq8wo3OUwKlS4XmNeopGmw
         QiFXRSNjOagwTIFztbuUUjbF6qBGjG5EqWUDnsTeDPvXGaymxUKOIkhLgXUhBk+u31iH
         KIugAhILIf72swrEM10d9I+R/hnEGyBQRfbBvyp9X5+3vTsquRDSlYzvCKLyAO71jQqU
         BRua/j4i2V6W3EhyxNLWaidgQSdHiAZQIMFRrHPCkrJLvjxQ+6Fva0moX1B3Za4LNly3
         grRreqi+zjsyRIBFuQd8pvJSluNizRXJPQij7kV+xmds96HDCKPquqbMibZf42oeDtAx
         5Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=R00xNPsCF8UW/szKUy4WCcj0M7xSEsY8VrV3QDe1Oo0=;
        b=TAsn/IXBoKo80Cg8XsRpatHZTyyJQXou8jUTWtbMQ31/TTWOO7keJ6B/CvxHCGrMKp
         7TfMn0U+ffb44CtvlHVl1h8jkZqafj1oyntE7JQr0NDI+o96IOKO9GdBwzCvZlSvET25
         syauNwwFRBgkcQ1DKvgbgowbUgmxppSM8yP+QZA5rExZz0aJgLW1TQhafOs0J/aSNuvS
         dDITmT4fvaRDOE5X6Ww6fjADCz/6Lk+FaYFSW5lY3uewKSAtmMvyWNhezTm9vgzS3fyc
         8MFZIH5KCsFtYMpkyJA1aiOEWDOYgqSRF5FUDYRsoOSZU5T6n7QFEIIjsYoBlu2SHvb9
         8/OQ==
X-Gm-Message-State: APjAAAWREfGp6qFcPACdEBz7KAB2yXj43Tlyg3fj+/HfToi6L2DQvrxB
        0yhGwLpxVphEpHqPhdSmLRY=
X-Google-Smtp-Source: APXvYqwFTbjgTXASmix+3u3414wvuMf8vHp4E+Qp8r0vx/3MvZxQpaU4ZHNyie4f5G1akERvond2Jw==
X-Received: by 2002:a17:90a:26e1:: with SMTP id m88mr1162523pje.101.1578421786005;
        Tue, 07 Jan 2020 10:29:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u3sm436809pga.72.2020.01.07.10.29.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 10:29:45 -0800 (PST)
Date:   Tue, 7 Jan 2020 10:29:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
        wim@linux-watchdog.org, p.zabel@pengutronix.de,
        matthias.bgg@gmail.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        yingjoe.chen@mediatek.com, sboyd@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20200107182944.GB22909@roeck-us.net>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200106215721.GB31059@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106215721.GB31059@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 06, 2020 at 03:57:21PM -0600, Rob Herring wrote:
> On Mon, 6 Jan 2020 11:11:35 +0800, Jiaxin Yu wrote:
> > Add #reset-cells property and update example
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
> >  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
> >  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
> >  3 files changed, 46 insertions(+), 3 deletions(-)
> >  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> > 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

v9 and a couple of versions before that did not include the update to
the bindings file. I got lost in the many versions and don't recall if
that was ever tagged as Reviewed-by: in an earlier version.

Guenter
