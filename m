Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2735A381B
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Aug 2022 16:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbiH0OZ7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Aug 2022 10:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbiH0OZ5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Aug 2022 10:25:57 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5885275EA
        for <linux-watchdog@vger.kernel.org>; Sat, 27 Aug 2022 07:25:56 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-11dca1c9c01so5568045fac.2
        for <linux-watchdog@vger.kernel.org>; Sat, 27 Aug 2022 07:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=68B0sNoP4V0SiB5PRV/vbtMt8lZeZ1c9jy9H+7Dqg8g=;
        b=Sy1llnSUiS8Rvf4Ab2TmvkdPGT0JUp2ahomnMXtls2VDlJp1nM7qUNe+u5lEqw8Fyk
         r6/PvOEMKbOKaaZXTpaWSNylW75qSh8l7Ux4UB4wvGvUAowldwDgc3nzw21FvWQF5OmM
         syOR+RbMCaFtNEwBRQpWZctfpKJxEFBkxafxgsBCw75KkJ/Iy3ybFGhEEwxQ1vsJvsTB
         LsE8wRgD5VJi5rJEKm/o5RdpPqVcvoQnbzNJzcKiXIzb6rNu1xeeIL52TVGQNH+zCJjo
         bfNhwN2iz6ChG5Pj93wfewwE25lAg/Et8cOVjx1P96sspVdUe1Xi/H8jtzn/3um8PtBw
         q6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=68B0sNoP4V0SiB5PRV/vbtMt8lZeZ1c9jy9H+7Dqg8g=;
        b=jUls5NHAVTHWaGulv07RLcQMznp9u2fVZzBjUQAb+oNp5swEWxEezAn9Y8OguUzsA4
         18yj+D6AR6aUchWx2Pa1OzbBaFZzImVGLALOL/RtV48eWS9pdZlYqUKzLSJuyj27T107
         FJNDWhFpaWOhMCiuMbes2MLUcemwT432idbS7qzqH8fCGDVW4JMGcrC0QoBCV1O1LOdk
         YY52eJ1KTHr6s7SpNgUlHQWl1sGTdPvYn31lQ70C/m0gV8stkpXM6hsMkXzQrsS7jt+B
         WbSHzGEZlKeIPlRem7oeVuTuCPJmo+R9oCppNkzYASd6fNbLlfCWL0kto0qhV/1fs7YT
         KjeA==
X-Gm-Message-State: ACgBeo3ZUi7Ho9c1O/KsTY4s1aoaycfyuwkIWhxWDNTBDoZW1nJRtBsF
        6xM04eR+c5I6C/TN1w0YIH7mFcqmLyn2kc5SORJYL5O40P8=
X-Google-Smtp-Source: AA6agR5GLPxu78pxS/zXZpmiPrH99wgTbjg1PyE1Y+qF7LxhuIQ649l8qHhoa5acBzcHCcTmFi7nVSkq3/unCO9GzCE=
X-Received: by 2002:a05:6870:210b:b0:101:cb62:8ccc with SMTP id
 f11-20020a056870210b00b00101cb628cccmr4152851oae.26.1661610356204; Sat, 27
 Aug 2022 07:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220826181921.3899603-1-saproj@gmail.com> <20220826205343.GA2909643@roeck-us.net>
In-Reply-To: <20220826205343.GA2909643@roeck-us.net>
From:   Sergei Antonov <saproj@gmail.com>
Date:   Sat, 27 Aug 2022 17:25:44 +0300
Message-ID: <CABikg9w6Pvr225ehS4E_hyBwRHPBdv-WpZUSiJoWjzczY5rB5A@mail.gmail.com>
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: implement _restart() function
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 26 Aug 2022 at 23:53, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Aug 26, 2022 at 09:19:21PM +0300, Sergei Antonov wrote:
> > Implement ftwdt010_wdt_restart(). It enables watchdog with timeout = 0
> > and disabled IRQ. Since it needs code similar to ftwdt010_wdt_start(),
> > add a new function ftwdt010_enable() and move common code there.
> >
> > Signed-off-by: Sergei Antonov <saproj@gmail.com>
>
> v2 ? Change log ?

OK. Just sent a patch with the same code, but v2 and updated description.
