Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D347098C9
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 May 2023 15:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjESNzJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 May 2023 09:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjESNzI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 May 2023 09:55:08 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F71712C
        for <linux-watchdog@vger.kernel.org>; Fri, 19 May 2023 06:55:07 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-253340db64fso3220982a91.2
        for <linux-watchdog@vger.kernel.org>; Fri, 19 May 2023 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684504507; x=1687096507;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+CEZRZEOJVmAfb07UohKPHalX/8xKQCW3mCwVUhKXY=;
        b=rM1oy/VcEqN+QQClQz6OKaQVVrrPbLKXvKUz1I3WrSEltiGXHWGDjkcHwSrVOG7OZ/
         lVQGGbAKQdCMqVW/Ikx3OXHIT1mYGGc8gTl6HoGgUTXTQ8W0TLAsg9EyLuCyUdLqLSBu
         h+X+ws3Ipz68QXu9rQE/2Dx9MG2xoNP3L0jqbqULTJjXhoqjBQYJWkaglln5Zn8pESz3
         +VKJuBvQf+/dWMrBr8Kn9JhY4g/jpkSVR5ftb3iv7OA8Ashyjw3sjV26g8UeYZmkPNVG
         ztFWfPCNzQNpNy18OexXS72AvhbEEeziQHibdlvJh78aK4N56ToEYoYP2T6O8ZxICyx1
         dcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684504507; x=1687096507;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+CEZRZEOJVmAfb07UohKPHalX/8xKQCW3mCwVUhKXY=;
        b=dhzRTf6VxFOzn+FqzJQ4q+IcY6nxd9AMX83PPpPAsJo8NXDdjAKoVRXAdur4zwSfFK
         XWj3qjpotGp82x0v2kGJYkiV4nVi9m6quJ6NCd3QW/bFQPpZjZTfn+BnM6zjFUIVhti5
         jcrIYHJ7xMrBc4bIdZlpES9D7XgE6+eirCSWWnrvklqBqgcdrDdOtD1oy+OJNtaGQipC
         KHMP/uzzENKNwlMd14gf9HLVCmGWxrAdFzn9lCaLdfowiPEWIiyCgs86tsEHXk2CJ584
         zbGeVsBdEaQUQkBXxnxKmV7eVrjpUiCV5yj3Xel93tiFSeFKeQX+ZakC/OzJML2SHFte
         MJwg==
X-Gm-Message-State: AC+VfDxE+DJRW+jTxEK8nQdBL/Bg1x5+ucis26/zvqJtVXfXfULM65zi
        SPKX+Mc83Gg5QbR61pCthuyix9mwye24LyX9L+0=
X-Google-Smtp-Source: ACHHUZ7PEIVu0OBB3/bhMJ39RaFUcrr4Py6/PuwxYqjOar1OCLXNo3sf6tJwT9NRW1YhGrHAlPvpR3WyvsPdkrj+iEY=
X-Received: by 2002:a17:90b:30d6:b0:24b:be0c:6134 with SMTP id
 hi22-20020a17090b30d600b0024bbe0c6134mr2006965pjb.33.1684504506945; Fri, 19
 May 2023 06:55:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:2387:b0:b5:d9d5:921c with HTTP; Fri, 19 May 2023
 06:55:06 -0700 (PDT)
Reply-To: godwinrichar800@gmail.com
From:   Richard Godwin <johnricher844@gmail.com>
Date:   Fri, 19 May 2023 06:55:06 -0700
Message-ID: <CAAAsin0vqhKp8FZOYUeDSdi7iWMkvkLnLu5kVRbi4Vw-5ttNNg@mail.gmail.com>
Subject: URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

-- 
Hello Dear Good Day,

I hope you are doing great,

I have something important to discuss with you

if you give me a listening ear.so that I can

write you in details thank you as i wait for

your reply.

Mr Richard Godwin
