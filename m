Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4542C936E
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 00:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388723AbgK3X5R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Nov 2020 18:57:17 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:55497 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388124AbgK3X5R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Nov 2020 18:57:17 -0500
Received: from CMGW (unknown [10.9.0.13])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id 929ED140437
        for <linux-watchdog@vger.kernel.org>; Mon, 30 Nov 2020 16:56:36 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id jt24kGAsfi1lMjt24kELjP; Mon, 30 Nov 2020 16:56:36 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.2 cv=VoRTO6+n c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10 a=nNwsprhYR40A:10
 a=evQFzbml-YQA:10 a=LpQP-O61AAAA:8 a=_jlGtV7tAAAA:8 a=o6rA3mgfRGNJ6BWNUK4A:9
 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7Cv2ADl5wlW0FzpIAWuvEi3KmaSqX25T5Zo5cTY82DY=; b=ohegBH8rAeAYMUwcTSAwXN/bM9
        u1+TQGrXe/1WCrhxvgI5TSJkOMGzxEzUgU2WB2gMUs5Th+IeMsjb36equeL3JN2i/QIviBEYZJzCq
        NXgLIsYYNIH6fBKqhzaU31SV4KvsgBtBPJA1fahpSqHvvrEfpjohl0BK2w3pIk/WaYeBLEuLcxjxL
        sqO3xnMw8VydIslyoDtwn7jVth1S/liAR/lng/KSXmAQOtXkjNjY48/3NDU5p+2Umi2zUJhOErqfV
        So74U/giXOYgZGhj1tQemhIr//fi0KN/hFIP1W3EnFP7vOLdWDUCVhJWB4gD7qD9677Un+/RuEkAA
        1FPf85JA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57056 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kjt23-002FmK-JI; Mon, 30 Nov 2020 23:56:35 +0000
Date:   Mon, 30 Nov 2020 15:56:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Kathiravan T <kathirav@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wim@linux-watchdog.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
Message-ID: <20201130235635.GA46844@roeck-us.net>
References: <20201031121115.542752-1-robert.marko@sartura.hr>
 <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net>
 <23aea80f-265b-8a23-e8ea-f46639dd4129@codeaurora.org>
 <5b7def39-8c23-d30f-e2d3-bc38beee8919@roeck-us.net>
 <dedebcc4-1c1f-bd56-07a6-ff7f44c06ed1@codeaurora.org>
 <CA+HBbNFtfNcGKC0Tv7cfeBO-4p_momdQ9fr1=1hEd4O2ieskfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNFtfNcGKC0Tv7cfeBO-4p_momdQ9fr1=1hEd4O2ieskfw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kjt23-002FmK-JI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57056
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 30, 2020 at 07:27:00PM +0100, Robert Marko wrote:
> On Mon, Nov 2, 2020 at 6:19 AM Kathiravan T <kathirav@codeaurora.org> wrote:
> >
> >
> > On 11/2/2020 10:33 AM, Guenter Roeck wrote:
> > > On 11/1/20 7:58 PM, Kathiravan T wrote:
> > >> On 10/31/2020 7:38 PM, Guenter Roeck wrote:
> > >>> On 10/31/20 5:11 AM, Robert Marko wrote:
> > >>>> If the watchdog hardware is enabled/running during boot, e.g.
> > >>>> due to a boot loader configuring it, we must tell the
> > >>>> watchdog framework about this fact so that it can ping the
> > >>>> watchdog until userspace opens the device and takes over
> > >>>> control.
> > >>>>
> > >>>> Do so using the WDOG_HW_RUNNING flag that exists for exactly
> > >>>> that use-case.
> > >>>>
> > >>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > >> Thanks for addressing the comments and now the patch looks good to me. One more suggestion, can we make the initcall level of the driver to subsys_initcall_sync so that the driver gets registered immediately after the watchdog_core is registered and watchdog_core starts pinging the WDT?
> > >>
> > > That would mean to replace module_platform_driver(), which would be a whole
> > > different discussion, is not widely needed, and would potentially interfere
> > > with the subsys_initcall_sync() in the watchdog core. This will require
> > > specific evidence that a problem is seen in the field, and that it is truly
> > > needed. Plus, it would have to be a different patch (which you could submit
> > > yourself, with evidence). Let's stick with one logical change per patch,
> > > please.
> > >
> > > Guenter
> > Yeah, of course I don't want to squash the initcall level change with
> > this one. Just made a suggestion to consider it. Anyway I will try to
> > collect some data and post the patch by own on that suggestion. Thanks
> > Guenter.
> >
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> >
> 
> Any chance this could be picked for 5.11?
> I have some boards depending on it for normal boot.
> 
It is queued in my watchdog-next branch, so Wim will most likely pick it up.

Guenter
