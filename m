Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC542C8CC6
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Nov 2020 19:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgK3S2K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Nov 2020 13:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbgK3S2K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Nov 2020 13:28:10 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14A9C061A04
        for <linux-watchdog@vger.kernel.org>; Mon, 30 Nov 2020 10:27:11 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id y74so15190698oia.11
        for <linux-watchdog@vger.kernel.org>; Mon, 30 Nov 2020 10:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pc6C/q8AO1EvQvE391qCwST8+WRMXp+q0hfDj9wNYAw=;
        b=djXM6E8vdJaLrQtz0so3aaOqlydAeD8rRYhWJfmTmhf1XBgs39cIuhQTEmzc3VBuoH
         Nmq+VDIQa+hxb11/329HPkwVBCa0ubSsxMW7E/h45obUbRhhfdqszxm1hyrWbVFhyiCK
         kiolMlQi2R1ZTCQqV/347xASuau78mYZjV8KoTqY4NOVS0aKYQcElJhbdB33aEtZPHqO
         PE1m3gR51q3Qbs30oQCId7xFiOYNY0AYCECMQzc87u3XHZzstkkijJbuZC6lOq52jsNK
         jo/fqxYWNNSEJGJh2ZDolRxdLEUlgOgQ7H2KTsmHIOFwjjft9H4sqtAzB7J2w/MfRFuv
         XuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pc6C/q8AO1EvQvE391qCwST8+WRMXp+q0hfDj9wNYAw=;
        b=JtW7AMn7fywrl9jc2Rfrgxghhcs4HsJsBGQ2r0eOtd6b7HKTh5r7th49HcnBqsEM2H
         HywYUkHiRfPTASNQsuGh+UkVdv3BFsRugNMu4tWvbL5KSa6foY9+nA/9Rf+LFrr20N7d
         td4XrQIpO03I/SIoj1giRgceVXmv6nlo/iDwzAKlC9QFRupKX3pbur+CMxdnjXRoWrEs
         lali733h4I4t7WaEIPpbzTMZ9vXV8mAz+4Sx5uDmAUgEclr720djIPxD0WQUWxnJnoo3
         oS+ma23qbd7bRwTruFmfT1fIz1TYNq9Q+0G5TU2md7qPj88swA+n51cq9onKuOjaNHMT
         N0zA==
X-Gm-Message-State: AOAM531byySdrd516OkGqIhX9mMZo8DX3KrNtfHEga9NFvDZcz09mApz
        QhxK5KuRLjRBIR2ueTFMktIfI1dPgqgFV2JeiUZQqQ==
X-Google-Smtp-Source: ABdhPJxaZrDB7qg+0edaZm1dy0P1aJ9TqaCP5fAWh99oVMGlrNZvWHbehxvVuo+GQ95PSAtiPILtYN6c6kVWqc7JtGo=
X-Received: by 2002:aca:a896:: with SMTP id r144mr117427oie.154.1606760831021;
 Mon, 30 Nov 2020 10:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20201031121115.542752-1-robert.marko@sartura.hr>
 <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net> <23aea80f-265b-8a23-e8ea-f46639dd4129@codeaurora.org>
 <5b7def39-8c23-d30f-e2d3-bc38beee8919@roeck-us.net> <dedebcc4-1c1f-bd56-07a6-ff7f44c06ed1@codeaurora.org>
In-Reply-To: <dedebcc4-1c1f-bd56-07a6-ff7f44c06ed1@codeaurora.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 30 Nov 2020 19:27:00 +0100
Message-ID: <CA+HBbNFtfNcGKC0Tv7cfeBO-4p_momdQ9fr1=1hEd4O2ieskfw@mail.gmail.com>
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when appropriate
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wim@linux-watchdog.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 2, 2020 at 6:19 AM Kathiravan T <kathirav@codeaurora.org> wrote=
:
>
>
> On 11/2/2020 10:33 AM, Guenter Roeck wrote:
> > On 11/1/20 7:58 PM, Kathiravan T wrote:
> >> On 10/31/2020 7:38 PM, Guenter Roeck wrote:
> >>> On 10/31/20 5:11 AM, Robert Marko wrote:
> >>>> If the watchdog hardware is enabled/running during boot, e.g.
> >>>> due to a boot loader configuring it, we must tell the
> >>>> watchdog framework about this fact so that it can ping the
> >>>> watchdog until userspace opens the device and takes over
> >>>> control.
> >>>>
> >>>> Do so using the WDOG_HW_RUNNING flag that exists for exactly
> >>>> that use-case.
> >>>>
> >>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >> Thanks for addressing the comments and now the patch looks good to me.=
 One more suggestion, can we make the initcall level of the driver to subsy=
s_initcall_sync so that the driver gets registered immediately after the wa=
tchdog_core is registered and watchdog_core starts pinging the WDT?
> >>
> > That would mean to replace module_platform_driver(), which would be a w=
hole
> > different discussion, is not widely needed, and would potentially inter=
fere
> > with the subsys_initcall_sync() in the watchdog core. This will require
> > specific evidence that a problem is seen in the field, and that it is t=
ruly
> > needed. Plus, it would have to be a different patch (which you could su=
bmit
> > yourself, with evidence). Let's stick with one logical change per patch=
,
> > please.
> >
> > Guenter
> Yeah, of course I don't want to squash the initcall level change with
> this one. Just made a suggestion to consider it. Anyway I will try to
> collect some data and post the patch by own on that suggestion. Thanks
> Guenter.
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member=
 of Code Aurora Forum, hosted by The Linux Foundation
>

Any chance this could be picked for 5.11?
I have some boards depending on it for normal boot.

Regards,
Robert
